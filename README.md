# step_4_cooperative_scheduler
Building on step 3, moving from an **implicit** scheduler towards an **explicit** disciplined, industry-style cooperative scheduler

### Using these versions:
* `STM32CubeIDE` : `1.18.1`
* `STM32CubeMX` : `6.14.1`

### What is this?
A tick-driven cooperative scheduler with:
* Fixed time base (1 ms)
* Multiple periodic tasks
* No blocking
* Deterministic execution order
* Explicit timing contracts

This is basically a tiny RTOS without preemption

## Core rules
* No delays anywhere
* ISRs only signal
* Tasks must return quickly
* Timing is explicit, not implicit

If a task blocks, the whole system stalls

## Step 1 - Task definition
Add the following above `main()`...
```c
typedef void (*task_fn_t)(void);

typedef struct
{
    task_fn_t fn;
    uint32_t  period_ms;
    uint32_t  last_run_ms;
} task_t;
```

## Step 2 - Global system tick
I already have...
```c
volatile uint32_t system_tick_ms;
```

## Step 3 - Define simple and purposeful tasks
The task functions I require are...
```c
void task_led(void)
{
    led_update(&led, system_tick_ms);
}

void task_button(void)
{
    if (button_debounce_update())
    {
        led.mode++;
        if (led.mode > LED_MODE_FAST)
        {
            led.mode = LED_MODE_OFF;
        }
    }
}

void task_idle(void)
{
    __WFI();  // Sleep until next interrupt
}
```
> [!NOTE]
> `led` must be moved to global scope now

## Step 4 - Task table
* this is the **true** scheduler

Add...
```c
#define TASK_COUNT 3

task_t tasks[TASK_COUNT] =
{
    { task_button,  10, 0 },   // 10 ms
    { task_led,      1, 0 },   // 1 ms
    { task_idle,     0, 0 }    // always
};
```

### Step 5 - Scheduler loop
* Replace the `while(1)` loop with...
```c
while (1)
{
    uint32_t now = system_tick_ms;

    for (int i = 0; i < TASK_COUNT; i++)
    {
        if (tasks[i].period_ms == 0 ||
            (now - tasks[i].last_run_ms) >= tasks[i].period_ms)
        {
            tasks[i].last_run_ms = now;
            tasks[i].fn();
        }
    }
}
```
* That’s the entire scheduler
  * No queues; no priorities; no magic


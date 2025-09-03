<script setup lang="ts">
import { twMerge } from "tailwind-merge";
import { computed } from "vue";

const props = withDefaults(
    defineProps<{
        type?: "submit" | "button";
        class?: string;
    }>(),
    {
        type: "submit",
    },
);

const defaultClasses = computed(() => {
    return twMerge(
        "bg-indigo-500 text-white rounded-md px-3 py-2 text-sm",
        props.class,
    );
});
</script>

<template>
    <button :type="type" :class="defaultClasses">
        <slot />
    </button>
</template>

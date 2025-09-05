<script setup lang="ts">
import { computed } from "vue";

const props = withDefaults(
    defineProps<{
        text: string;
        type: "success" | "warning" | "danger" | "info";
    }>(),
    {
        type: "info",
    },
);

const classes = computed(() => {
    if (props.type === "success") {
        return "bg-teal-600/70 text-white px-2 rounded-xl text-xs";
    } else if (props.type === "danger") {
        return "bg-red-600/70 text-white px-2 rounded-xl text-xs";
    } else if (props.type === "warning") {
        return "bg-yellow-600/70 text-white px-2 rounded-xl text-xs";
    } else if (props.type === "info") {
        return "bg-cyan-600/70 text-white px-2 rounded-xl text-xs";
    }
});
</script>

<template>
    <div role="alert" :class="classes">
        <p>{{ text }}</p>
    </div>
</template>

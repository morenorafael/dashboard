<script setup lang="ts">
import { computed } from "vue";

const props = withDefaults(
    defineProps<{
        message: string;
        type: "success" | "warning" | "danger" | "info";
    }>(),
    {
        type: "info",
    },
);

const classes = computed(() => {
    if (props.type === "success") {
        return "bg-teal-600/70 text-teal-50 p-2 rounded-lg";
    } else if (props.type === "danger") {
        return "bg-red-600/70 text-red-50 p-2 rounded-lg";
    } else if (props.type === "warning") {
        return "bg-yellow-600/70 text-yellow-50 p-2 rounded-lg";
    } else if (props.type === "info") {
        return "bg-cyan-600/70 text-cyan-50 p-2 rounded-lg";
    }
});
</script>

<template>
    <div role="alert" :class="classes">
        <p>{{ message }}</p>
    </div>
</template>

<script setup lang="ts">
import Dialog from './Dialog.vue';

withDefaults(
    defineProps<{
        show?: boolean;
        maxWidth?: "sm" | "md" | "lg" | "xl" | "2xl" | "6xl";
    }>(),
    {
        show: false,
        maxWidth: "2xl",
    },
);
</script>

<template>
    <Dialog :show="show" :maxWidth="maxWidth">
        <div class="border-b border-gray-200 p-4 flex justify-between items-center">
            <slot name="header" />
        </div>

        <div class="p-4 border-b border-gray-200">
            <slot name="body" />
        </div>
        <div class="p-4 flex justify-end space-x-2">
            <slot name="footer" />
        </div>
    </Dialog>
</template>

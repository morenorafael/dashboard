<script setup lang="ts">
withDefaults(
    defineProps<{
        value: string;
        optional?: boolean;
    }>(),
    {
        optional: false,
    },
);
</script>

<template>
    <div class="flex items-center gap-1">
        <label class="block text-xs text-gray-700">
            <span v-if="value">{{ value }}</span>
            <span v-else><slot /></span>
        </label>
    </div>
</template>

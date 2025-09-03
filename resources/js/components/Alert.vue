<script setup lang="ts">
defineProps<{
    message: string;
}>();
</script>

<template>
    <div
        class="bg-green-200 border border-green-300 rounded-md p-2 text-green-700 text-sm"
    >
        <p>{{ message }}</p>
    </div>
</template>

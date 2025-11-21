<script setup lang="ts">
import { Link } from "@inertiajs/vue3";

withDefaults(
    defineProps<{
        href: string;
        text: string;
        active?: boolean;
    }>(),
    {
        active: false,
    },
);
</script>

<template>
    <Link
        :href="href"
        class="hover:bg-gray-300/40 p-1 rounded-md flex items-center"
        :class="{ 'bg-indigo-300/40 text-indigo-600': active }"
    >
        <slot v-if="active" name="activeIcon" />
        <slot v-else name="icon" />

        {{ text }}
    </Link>
</template>

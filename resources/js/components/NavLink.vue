<script setup lang="ts">
import { Link } from "@inertiajs/vue3";

withDefaults(
    defineProps<{
        href: string;
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
        class="w-full px-2 py-1 flex items-center hover:bg-gray-300 rounded-lg"
        :class="{ 'bg-indigo-200 font-semibold': active }"
    >
        <slot />
    </Link>
</template>

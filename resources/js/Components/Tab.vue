<script setup lang="ts">
import { Link } from "@inertiajs/vue3";

withDefaults(
    defineProps<{
        text: string;
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
        class="hover:bg-gray-300/40 text-gray-500 px-2 py-2 rounded-lg relative"
        :class="{ 'text-gray-600 font-semibold': active }"
    >
        {{ text }}
        <span
            v-if="active"
            class="absolute w-full h-0.5 bg-gray-500 left-0 -bottom-1.5"
        ></span>
    </Link>
</template>

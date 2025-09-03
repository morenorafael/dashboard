<script setup lang="ts">
import { Link } from "@inertiajs/vue3";
import { ref } from "vue";
import Nav from "./Nav.vue";

const open = ref<boolean>(false);
</script>

<template>
    <button @click="open = true" class="cursor-pointer block md:hidden">
        <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="size-6"
        >
            <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
            />
        </svg>
    </button>

    <div
        @click="open = false"
        v-if="open"
        class="fixed w-full min-h-screen bg-gray-800/40 top-0 left-0 z-10 backdrop-blur-xs block md:hidden"
    ></div>

    <div
        class="absolute w-3/5 bg-gray-900 -left-80 top-0 transition duration-300 ease-in-out min-h-screen z-20 block md:hidden"
        :class="{ 'translate-x-80': open }"
    >
        <div class="px-10 py-5">
            <h1 class="font-semibold text-lg">DocAlerta</h1>
        </div>
        <div
            class="bg-gray-100 mx-4 rounded-lg text-gray-700 overflow-hidden p-2 space-y-2"
        >
            <Nav />
        </div>
    </div>
</template>

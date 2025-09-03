<script setup lang="ts">
import { ref } from "vue";
import Nav from "./Nav.vue";

const open = ref<boolean>(false);

const openNav = () => {
    open.value = true;
};

const closeNav = () => {
    open.value = false;
};
</script>

<template>
    <button @click="openNav" class="md:hidden">
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
        v-if="open"
        @click="closeNav"
        class="fixed top-0 left-0 bg-gray-600/20 w-full h-full"
    ></div>

    <div
        class="absolute w-68 top-0 -left-68 bg-white border-r border-gray-200 py-4 transition duration-300 ease-in-out"
        :class="{ 'translate-x-68': open }"
    >
        <Nav />
    </div>
</template>

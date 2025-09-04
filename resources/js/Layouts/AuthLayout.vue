<script setup lang="ts">
import { Link } from "@inertiajs/vue3";
</script>

<template>
    <header
        class="flex items-center px-4 md:px-10 py-4 justify-between absolute w-full"
    >
        <div>LOGO</div>
        <div class="text-xs flex space-x-4 items-center">
            <p>¿No tienes una cuenta?</p>

            <Link
                :href="route('register')"
                class="bg-indigo-500 rounded-lg text-white py-2 px-4 font-semibold shadow-2xl shadow-indigo-700"
                >Regístrate</Link
            >
        </div>
    </header>

    <main class="flex items-center justify-center m-auto h-screen">
        <div class="px-4 md:px-0">
            <slot />
        </div>
    </main>

    <div
        class="fixed -z-10 bg-linear-65 from-purple-500 to-pink-500 h-screen top-1/2 w-[150%] -rotate-12 left-0"
    ></div>
</template>

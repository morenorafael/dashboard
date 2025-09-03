<script setup lang="ts">
import Header from "@/components/Authenticated/Header.vue";
import Nav from "@/components/Authenticated/Nav.vue";
</script>

<template>
    <Header />

    <div class="flex">
        <Nav class="hidden md:block" />

        <main class="w-full">
            <slot />
        </main>
    </div>
</template>

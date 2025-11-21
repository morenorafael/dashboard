<script setup lang="ts">
import PageTitle from "@/Components/PageTitle.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
</script>

<template>
    <AuthenticatedLayout>
            <PageTitle subtitle="Menu" title="Starter Page" />
            <div class="card h-40"></div>
    </AuthenticatedLayout>
</template>

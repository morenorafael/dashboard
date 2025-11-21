<script setup lang="ts">
import Alert from "@/Components/Alert.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import Content from "@/Layouts/Content.vue";
</script>

<template>
    <AuthenticatedLayout>
        <div class="md:pr-4 text-sm text-gray-600">
            <Content class="divide-y divide-gray-200">
                <div class="p-3">
                    <h3 class="mb-4">Simples</h3>

                    <div class="space-y-4">
                        <Alert
                            message="Este es el mesaje de alerta!"
                            type="success"
                        />
                        <Alert
                            message="Este es el mesaje de alerta!"
                            type="danger"
                        />
                        <Alert
                            message="Este es el mesaje de alerta!"
                            type="warning"
                        />
                        <Alert
                            message="Este es el mesaje de alerta!"
                            type="info"
                        />
                    </div>
                </div>
            </Content>
        </div>
    </AuthenticatedLayout>
</template>

D40RB

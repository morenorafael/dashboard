<script setup lang="ts">
import InputError from "@/components/InputError.vue";
import InputLabel from "@/components/InputLabel.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import TextInputIcon from "@/components/TextInputIcon.vue";
import AuthLayout from "@/Layouts/AuthLayout.vue";
import { EnvelopeIcon } from "@heroicons/vue/24/outline";
import { Head, useForm } from "@inertiajs/vue3";

defineProps<{
    status?: string;
}>();

const form = useForm({
    email: "",
});

const submit = () => {
    form.post(route("password.email"));
};
</script>

<template>
    <AuthLayout>
        <Head title="Restablecer contraseña" />
        <form
            @submit.prevent="submit"
            class="space-y-4 bg-white m-auto max-w-96 rounded-xl p-10 flex-auto items-center shadow-2xl shadow-gray-600/40"
        >
            <h1 class="text-xl text-center font-bold mb-6">
                ¿Olvidaste tu contraseña?
            </h1>

            <p class="text-sm text-gray-600">
                No hay problema. Solo introduce tu correo electrónico y te
                enviaremos un enlace para restablecer tu contraseña y podrás
                elegir una nueva.
            </p>

            <div
                v-if="status"
                class="mb-4 text-sm font-medium text-green-600 dark:text-green-400"
            >
                {{ status }}
            </div>

            <div>
                <InputLabel value="Correo electrónico" />

                <TextInputIcon
                    :required="true"
                    v-model="form.email"
                    dusk="email"
                    type="email"
                    placeholder="Ingresa tu correo electrónico"
                >
                    <template #icon>
                        <EnvelopeIcon class="size-5 ml-1" />
                    </template>
                </TextInputIcon>

                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <div class="mt-4 flex items-center justify-end">
                <PrimaryButton
                    :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing"
                >
                    Restablecer de contraseña
                </PrimaryButton>
            </div>
        </form>
    </AuthLayout>
</template>

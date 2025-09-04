<script setup lang="ts">
import InputError from "@/components/InputError.vue";
import InputLabel from "@/components/InputLabel.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import TextInput from "@/components/TextInput.vue";
import TextInputIcon from "@/components/TextInputIcon.vue";
import AuthLayout from "@/Layouts/AuthLayout.vue";
import {
    EnvelopeIcon,
    LockClosedIcon,
    UserIcon,
} from "@heroicons/vue/24/outline";
import { Head, Link, useForm } from "@inertiajs/vue3";

const form = useForm({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});

const submit = () => {
    form.post(route("register"), {
        onFinish: () => {
            form.reset("password", "password_confirmation");
        },
    });
};
</script>

<template>
    <AuthLayout>
        <Head title="Register" />

        <form
            @submit.prevent="submit"
            class="space-y-4 bg-white m-auto max-w-96 rounded-xl p-10 flex-auto items-center shadow-2xl shadow-gray-600/40"
        >
            <h1 class="text-2xl text-center font-bold mb-6">
                ¡Te damos la bienvenida!
            </h1>

            <div>
                <InputLabel for="name" value="Nombre y apellido" />

                <TextInputIcon
                    :required="true"
                    v-model="form.name"
                    dusk="name"
                    type="text"
                    placeholder="John Doe"
                >
                    <template #icon>
                        <UserIcon class="size-5 ml-1" />
                    </template>
                </TextInputIcon>

                <InputError class="mt-2" :message="form.errors.name" />
            </div>

            <div class="mt-4">
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

            <div class="mt-4">
                <InputLabel value="Elige una contraseña" />

                <TextInputIcon
                    :required="true"
                    v-model="form.password"
                    dusk="password"
                    type="password"
                    placeholder="Minimo 8 caracteres"
                >
                    <template #icon>
                        <LockClosedIcon class="size-5 ml-1" />
                    </template>
                </TextInputIcon>

                <InputError class="mt-2" :message="form.errors.password" />
            </div>

            <div class="mt-4">
                <InputLabel value="Confirmar" />

                <TextInputIcon
                    :required="true"
                    v-model="form.password_confirmation"
                    dusk="password"
                    type="password"
                    placeholder="Confirma la contraseña"
                >
                    <template #icon>
                        <LockClosedIcon class="size-5 ml-1" />
                    </template>
                </TextInputIcon>

                <InputError
                    class="mt-2"
                    :message="form.errors.password_confirmation"
                />
            </div>

            <div class="mt-4 flex items-center justify-end">
                <PrimaryButton
                    class="w-full"
                    :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing"
                >
                    Registrarme
                </PrimaryButton>
            </div>
        </form>

        <div class="m-auto max-w-96 text-center text-xs mt-10 text-white">
            ¿Ya estás registrado?
            <Link :href="route('login')" class="underline decoration-dotted"
                >Iniciar sesión</Link
            >
        </div>
    </AuthLayout>
</template>

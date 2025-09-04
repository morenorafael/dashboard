<script setup lang="ts">
import InputLabel from "@/components/InputLabel.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import TextInputIcon from "@/components/TextInputIcon.vue";
import AuthLayout from "@/Layouts/AuthLayout.vue";
import { EnvelopeIcon, LockClosedIcon } from "@heroicons/vue/24/outline";
import { Link, useForm } from "@inertiajs/vue3";

const form = useForm({
    email: "",
    password: "",
    remember: false,
});

const submit = () => {
    form.post(route("login"), {
        onFinish: () => form.reset("password"),
    });
};
</script>

<template>
    <AuthLayout>
        <form
            @submit.prevent="submit"
            class="space-y-4 bg-white m-auto max-w-96 rounded-xl p-10 flex-auto items-center shadow-2xl shadow-gray-600/40"
        >
            <h1 class="text-2xl text-center font-bold mb-6">
                ¡Te damos la bienvenida de nuevo!
            </h1>

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
            </div>
            <div>
                <InputLabel value="Contraseña" />

                <TextInputIcon
                    :required="true"
                    v-model="form.password"
                    dusk="password"
                    type="password"
                    placeholder="Escriba la contraseña"
                >
                    <template #icon>
                        <LockClosedIcon class="size-9 ml-1" />
                    </template>

                    <template #link>
                        <Link
                            :href="route('password.request')"
                            class="hover:underline decoration-dotted forgot-password text-indigo-500 block w-full text-right"
                            >¿Olvidaste la contraseña?</Link
                        >
                    </template>
                </TextInputIcon>
            </div>

            <PrimaryButton type="submit" dusk="btn-login" class="w-full">
                Iniciar sesión
            </PrimaryButton>
        </form>

        <div class="m-auto max-w-96 text-center text-xs mt-10 text-white">
            ¿No tienes cuenta?
            <Link :href="route('register')" class="underline decoration-dotted"
                >Regístrate</Link
            >
        </div>
    </AuthLayout>
</template>

<style lang="css" scoped>
.forgot-password {
    font-size: 10px;
}
</style>

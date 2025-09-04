<script setup lang="ts">
import InputLabel from "@/components/InputLabel.vue";
import PrimaryButton from "@/components/PrimaryButton.vue";
import TextInput from "@/components/TextInput.vue";
import AuthLayout from "@/Layouts/AuthLayout.vue";
import { useForm } from "@inertiajs/vue3";

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
            class="space-y-4 bg-white m-auto max-w-96 rounded-xl p-10 flex-auto items-center shadow-2xl shadow-gray-300"
        >
            <div>
                <InputLabel value="Correo electrónico" />

                <TextInput
                    dusk="email"
                    required
                    v-model="form.email"
                    type="email"
                    placeholder="Email"
                    autofocus
                    class="w-full"
                />
            </div>
            <div>
                <InputLabel value="Contraseña" />

                <TextInput
                    dusk="password"
                    required
                    v-model="form.password"
                    type="password"
                    placeholder="Password"
                    class="w-full"
                />
            </div>

            <PrimaryButton type="submit" dusk="btn-login" class="w-full">
                Iniciar sesión
            </PrimaryButton>
        </form>
    </AuthLayout>
</template>

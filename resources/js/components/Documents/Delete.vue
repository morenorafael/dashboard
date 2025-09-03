<script setup lang="ts">
import { ref } from "vue";
import Modal from "../Modal.vue";
import PrimaryButton from "../PrimaryButton.vue";
import TextInput from "../TextInput.vue";
import { useForm } from "@inertiajs/vue3";
import CategoryService from "@/Services/CategoryService";
import { ICategory, IDocument } from "@/Interfaces";
import DangerButton from "../DangerButton.vue";

const open = ref<boolean>(false);
const props = defineProps<{
    document: IDocument;
}>();

const form = useForm({});

const submit = () => {
    form.delete(route("documents.destroy", props.document), {
        onSuccess: () => {
            form.reset();
            closeModal();
        },
    });
};

const openModal = () => {
    open.value = true;
};

const closeModal = () => {
    open.value = false;
};
</script>

<template>
    <button
        :dusk="`btn-delete-document-form-${document.id}`"
        @click="openModal"
        type="button"
        class="text-red-500"
    >
        <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="size-5"
        >
            <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0"
            />
        </svg>
    </button>

    <Modal :show="open" @close="closeModal" maxWidth="md">
        <div class="p-6">
            <div class="mb-6 flex items-center justify-between">
                <h2 class="font-semibold text-sm">
                    ¿Quieres eliminar este documento?
                </h2>

                <button @click="closeModal" class="text-gray-600">
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
                            d="M6 18 18 6M6 6l12 12"
                        />
                    </svg>
                </button>
            </div>

            <form @submit.prevent="submit" class="space-y-4">
                <p class="text-sm text-gray-600">
                    No se le notificará la expiración de este documento.
                </p>

                <DangerButton
                    type="submit"
                    dusk="btn-delete-document"
                    class="w-full md:w-auto"
                >
                    Si, estoy seguro
                </DangerButton>
            </form>
        </div>
    </Modal>
</template>

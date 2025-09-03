<script setup lang="ts">
import { ref } from "vue";
import Modal from "../Modal.vue";
import PrimaryButton from "../PrimaryButton.vue";
import TextInput from "../TextInput.vue";
import { useForm } from "@inertiajs/vue3";
import CategoryService from "@/Services/CategoryService";
import { ICategory } from "@/Interfaces";
import InputError from "../InputError.vue";

const open = ref<boolean>(false);
const categories = ref<Array<ICategory>>([]);

const form = useForm({
    name: "",
    category_id: 0,
    expiration_date: "",
});

const submit = () => {
    form.post(route("documents.store"), {
        onSuccess: () => {
            form.reset();
            closeModal();
        },
    });
};

const openModal = () => {
    open.value = true;
    getCategories();
};

const closeModal = () => {
    open.value = false;
};

const getCategories = () => {
    CategoryService.index().then((data) => {
        categories.value = data;
    });
};
</script>

<template>
    <PrimaryButton
        @click="openModal"
        dusk="btn-create-document-form"
        class="md:w-42"
    >
        Agregar documento
    </PrimaryButton>

    <Modal :show="open" @close="closeModal" maxWidth="md">
        <div class="p-6">
            <div class="mb-6 flex items-center justify-between">
                <h2 class="font-semibold text-sm">Agregar documento</h2>

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
                <div>
                    <select
                        dusk="category_id"
                        v-model="form.category_id"
                        class="w-full border border-gray-200 rounded-md bg-white p-2"
                    >
                        <option value="0">Seleccione</option>
                        <optgroup
                            v-for="category in categories"
                            :key="`category-${category.id}`"
                            :label="category.name"
                        >
                            <option
                                v-for="subcategory in category.subcategories"
                                :key="`subcategory-${subcategory.id}`"
                                :value="subcategory.id"
                            >
                                {{ subcategory.name }}
                            </option>
                        </optgroup>
                    </select>
                </div>
                <div>
                    <TextInput
                        dusk="name"
                        required
                        v-model="form.name"
                        type="name"
                        placeholder="Nombre del documento"
                        class="w-full"
                    />
                </div>
                <div>
                    <TextInput
                        dusk="expiration_date"
                        required
                        v-model="form.expiration_date"
                        type="date"
                        placeholder="Fecha de vencimiento"
                        class="w-full"
                    />

                    <InputError
                        :message="form.errors.expiration_date"
                        class="mt-2"
                    />
                </div>

                <PrimaryButton
                    type="submit"
                    dusk="btn-create-document"
                    class="w-full"
                >
                    Guardar
                </PrimaryButton>
            </form>
        </div>
    </Modal>
</template>

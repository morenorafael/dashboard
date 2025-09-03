<script setup lang="ts">
import { ref } from "vue";
import Modal from "../Modal.vue";
import PrimaryButton from "../PrimaryButton.vue";
import TextInput from "../TextInput.vue";
import { useForm } from "@inertiajs/vue3";
import CategoryService from "@/Services/CategoryService";
import { ICategory, IDocument } from "@/Interfaces";
import InputError from "../InputError.vue";

const open = ref<boolean>(false);
const categories = ref<Array<ICategory>>([]);

const props = defineProps<{
    document: IDocument;
}>();

const form = useForm({
    name: props.document.name,
    category_id: props.document.category_id,
    expiration_date: props.document.expiration_date,
});

const submit = () => {
    form.put(route("documents.update", props.document), {
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
    <button
        :dusk="`btn-edit-document-form-${document.id}`"
        @click="openModal"
        type="button"
        class="text-indigo-500"
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
                d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10"
            />
        </svg>
    </button>

    <Modal :show="open" @close="closeModal" maxWidth="md">
        <div class="p-6">
            <div class="mb-6 flex items-center justify-between">
                <h2 class="font-semibold text-sm">Modificar documento</h2>

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
                        <optgroup
                            v-for="category in categories"
                            :key="`category-${category.id}`"
                            :label="category.name"
                        >
                            <option
                                v-for="subcategory in category.subcategories"
                                :selected="
                                    props.document.category_id ===
                                    subcategory.id
                                "
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
                    dusk="btn-edit-document"
                    class="w-full"
                >
                    Guardar
                </PrimaryButton>
            </form>
        </div>
    </Modal>
</template>

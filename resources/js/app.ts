import "./bootstrap";

import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import type { DefineComponent } from "vue";
import { createApp, h } from "vue";
import { ZiggyVue } from "ziggy-js";

import "swiper/css";
import "swiper/css/pagination";
import "../css/style.css";
import "preline/dist";

// import { createHead } from "@vueuse/head";
import { createPinia } from "pinia";
import piniaPersistedState from "pinia-plugin-persistedstate";

const appName = import.meta.env.VITE_APP_NAME || "Laravel";

const pinia = createPinia();
pinia.use(piniaPersistedState);

createInertiaApp({
    title: (title) => (title ? `${title} - ${appName}` : appName),
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.vue`,
            import.meta.glob<DefineComponent>("./Pages/**/*.vue"),
        ),
    setup({ el, App, props, plugin }) {
        createApp({ render: () => h(App, props) })
            .use(pinia)
            .use(plugin)
            .use(ZiggyVue)
            // .use(createHead)
            .mount(el);
    },
    progress: {
        color: "#4B5563",
    },
});

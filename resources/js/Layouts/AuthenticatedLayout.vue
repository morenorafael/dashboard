<script setup lang="ts">
import { useLayout } from '@/stores/layout';
import { onMounted } from 'vue';
import MobileMenu from './Components/MobileMenu/MobileMenu.vue';
import Sidenav from './Components/Sidenav/Sidenav.vue';
import Topbar from './Components/Topbar/Topbar.vue';
import Footer from './Components/Footer/Footer.vue';
import Customizer from './Components/Customizer/Customizer.vue';

defineProps<{
    mainClass?: string
}>();

const { layout, setSideNavSize } = useLayout();

onMounted(() => {
  const resize = () => {
    if (window.innerWidth <= 768) {
      setSideNavSize('offcanvas')
    } else if (window.innerWidth <= 1140) {
      setSideNavSize('default')
    } else {
      setSideNavSize('default')
    }
  }

  resize()
  window.addEventListener('resize', resize)
});
</script>

<template>
    <div class="wrapper">
        <MobileMenu v-if="layout.sidenav.size === 'offcanvas'" />
        <Sidenav v-else-if="layout.sidenav.size !== 'hidden'" />
        <div class="page-content">
            <Topbar />
            <main :class="mainClass">
                <slot />
            </main>
            <Footer />
        </div>
    </div>
    <client-only>
    <Customizer />
    </client-only>
</template>

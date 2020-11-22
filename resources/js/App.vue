<template>
  <header-base></header-base>

  <div class="app-drawer-layout mdc-top-app-bar--fixed-adjust">
    <navbar-base></navbar-base>
    <main class="mdc-drawer-app-content main-content">
        <router-view></router-view>
    </main>
  </div>

</template>

<script>

import HeaderBase from "./components/base/HeaderBase";
import NavbarBase from "./components/base/NavbarBase";
export default {
  name: 'App',
  components: {
    HeaderBase,
    NavbarBase,

  },
    provide:{
      baseURL: 'http://deluxe.com',
    }
}
</script>

<style>
#app{
  font-family: "PT Sans",sans-serif;
}

</style>

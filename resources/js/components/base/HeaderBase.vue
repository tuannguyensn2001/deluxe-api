<template>
  <header class="mdc-top-app-bar">
    <div class="mdc-top-app-bar__row">
      <section
          class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start"
      >
        <button
            class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons"
            href="#"
        >
          menu
        </button>
        <router-link
            to="/"
            class="mdc-top-app-bar__title"
            style="color: inherit"
        >Quản trị admin</router-link
        >
      </section>
      <section
          class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end"
          role="toolbar"
      >
        <button
            @click="logout()"
            class="material-icons mdc-top-app-bar__action-item mdc-icon-button"
            aria-label="power_settings_new"
        >
          power_settings_new
        </button>
      </section>
    </div>
  </header>
</template>

<script>
  export default{

  }
</script>
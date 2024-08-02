<template>
  <div>
    <h1>Star Trek Resource Clicker</h1>
    <div id="clickable-area" @click="handleClick" :style="{ backgroundColor: randomColor }">
      {{ message }}
    </div>
    <div>
      <h2>Resources: {{ resources }}</h2>
      <button @click="resetGame">Reset Game</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      resources: 0,
      randomColor: "",
      message: "",
    };
  },
  mounted() {
    // Restore game data from local storage
    this.resources = parseInt(localStorage.getItem("resources") || 0);
    this.updateRandomBackground();
    this.updateMessage();
  },
  methods: {
    handleClick() {
      this.resources++;
      localStorage.setItem("resources", this.resources);
      this.updateRandomBackground();
      this.updateMessage();
    },
    updateRandomBackground() {
      this.randomColor = `#${Math.floor(Math.random() * 16777215).toString(16)}`;
    },
    updateMessage() {
      this.message = `Clicked ${this.resources} times! Live long and prosper!`;
    },
    resetGame() {
      this.resources = 0;
      localStorage.removeItem("resources");
      this.updateRandomBackground();
      this.updateMessage();
    },
  },
};
</script>

<style>
#clickable-area {
  width: 400px;
  height: 400px;
  border: 3px solid #fff;
  text-align: center;
  line-height: 400px;
  font-size: 2rem;
  cursor: pointer;
}
</style>
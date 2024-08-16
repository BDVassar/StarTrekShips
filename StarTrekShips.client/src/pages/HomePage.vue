<template>
  <div>
    <ResourceGame></ResourceGame>
  </div>
  <div>
    <Ships></Ships>
  </div>
  <div>
    <CrewMembers></CrewMembers>
  </div>
  <div>
    <h1>Welcome to the Star Trek Ship Combat Game</h1>
    <!-- Inject the FederationShipGame component here -->
    <federation-ship-game></federation-ship-game>
  </div>
</template>

<script>

export default {
  onMounted() {
  },
  data() {
    return {
    };
  },
};
</script>

<style scoped lang="scss">
.home {
  display: grid;
  height: 80vh;
  place-content: center;
  text-align: center;
  user-select: none;

  .home-card {
    width: 50vw;

    >img {
      height: 200px;
      max-width: 200px;
      width: 100%;
      object-fit: contain;
      object-position: center;
    }
  }
}
</style>

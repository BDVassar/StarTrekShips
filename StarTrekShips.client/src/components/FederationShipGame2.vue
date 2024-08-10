<template>
  <div class="container">
    <div class="row" id="hero"></div>
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <button class="btn btn-primary" @click="attackBorg">Attack Borg</button>
      </div>
    </div>
    <div class="row" id="boss"></div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      heros: [
        {
          name: 'voyager',
          phasers: 20,
          photons: 40,
          health: 100,
          energy: 100,
          selected: true,
        },
        {
          name: 'enterprise',
          phasers: 30,
          photons: 30,
          health: 100,
          energy: 100,
          selected: false,
        },
        {
          name: 'defiant',
          phasers: 10,
          photons: 50,
          health: 100,
          energy: 100,
          selected: false,
        },
        {
          name: 'runabout',
          phasers: 10,
          photons: 20,
          health: 100,
          energy: 100,
          selected: false,
        },
      ],
      bosses: [
        {
          name: 'borg-cube',
          phasers: 30,
          photons: 40,
          health: 500,
          selected: true,
        },
      ],
    };
  },
  methods: {
    attackBorg() {
      // Calculate the combined attack strength of all selected players
      const attack = this.heros.reduce((total, hero) => {
        if (hero.selected) {
          return total + hero.phasers;
        }
        return total;
      }, 0);

      // Subtract the attack from the selected boss' health
      this.bosses.forEach((boss) => {
        if (boss.selected) {
          boss.health -= attack;
          if (boss.health <= 0) {
            boss.health = 0;
          }
        }
      });

      // Update the display
      this.drawCards();
    },
    drawCards() {
      const heroCards = this.heros
        .map((hero) => {
          const card = `
            <div class="col-3 text-center">
              <div class="card h-${hero.name} h-card">
                <h3 id="${hero.name}">${hero.name}</h3>
                <h5>Phasers: ${hero.phasers}</h5>
                <h5>Photons: ${hero.photons}</h5>
                <h5>Structural Integrity: ${hero.health}</h5>
              </div>
            </div>
          `;
          return card;
        })
        .join('');

      document.getElementById('hero').innerHTML = heroCards;

      const bossCards = this.bosses
        .map((boss) => {
          const card = `
            <div class="col-6 text-center">
              <div class="card ${boss.name} h-card" id="${boss.name}" @click="attackBorg">
                <h3>${boss.name}</h3>
                <h5>Phasers: ${boss.phasers}</h5>
                <h5>Photons: ${boss.photons}</h5>
                <h5>Structural Integrity: ${boss.health}</h5>
              </div>
            </div>
          `;
          return card;
        })
        .join('');

      document.getElementById('boss').innerHTML = bossCards;
    },
    addPlayer(name) {
      this.heros.forEach((hero) => {
        if (hero.name === name) {
          hero.selected = true;
        }
      });
      this.drawCards();
    },
    borgAttack() {
      // Calculate the combined attack strength of all selected bosses
      const attack = this.bosses.reduce((total, boss) => {
        if (boss.selected) {
          return total + boss.phasers;
        }
        return total;
      }, 0);

      // Subtract the attack from the health of all selected heroes
      this.heros.forEach((hero) => {
        if (hero.selected) {
          hero.health -= attack;
          if (hero.health <= 0) {
            hero.health = 0;
          }
        }
      });

      // Update the display
      this.drawCards();
    },
  },
  mounted() {
    // Initial display of cards
    this.drawCards();

    // Set up an interval to call the Borg attack every 5 seconds
    setInterval(() => this.borgAttack(), 5000);
  },
};
</script>

<style>
.gameContainer {
  background-image: url(https://images.unsplash.com/photo-1504333638930-c8787321eee0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80);
}

.borg-cube {
  background-color: #0000;
  background-position: center;
  background-size: contain;
  background-repeat: no-repeat;
}

.h-voyager {
  background-image: url(https://s3-us-west-1.amazonaws.com/cryptospacecommander/art/ST_Voyager_main_02.png);
}

.h-enterprise {
  background-image: url(http://cdn.shopify.com/s/files/1/1048/8552/products/sttng_ship_grande.png?v=1552933855);
}

.h-defiant {
  background-image: url(https://s3-us-west-1.amazonaws.com/cryptospacecommander/art/ST_Defiant_main_02.png);
}

.h-runabout {
  background-image: url(https://s3-us-west-1.amazonaws.com/cryptospacecommander/art/ST_RioGrande_main_02.png);
}

.borg-cube {
  background-image: url(https://s3-us-west-1.amazonaws.com/cryptospacecommander/art/Borg_cube_Main_01.png);
}

.img-win {
  background-image: url(https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/09/Star-Trek-Enterprise-Ships-Feature-e1600494738916.jpeg);
  background-color: #0000;
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
}

.h-card {
  min-height: 40vh;
}
</style>
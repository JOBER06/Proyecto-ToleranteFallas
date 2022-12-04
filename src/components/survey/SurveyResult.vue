<template>
  <li>
    <p>
      <span class="highlight">{{ name }}</span> calificó la experiencia de aprendizaje
      <span :class="ratingClass">{{ rating }}</span>.
    </p>
  </li>
</template>

<script>
export default {
  name: 'Survey',
  props: ['name', 'rating'],
  computed: {
    ratingClass() {
      return 'highlight rating--' + this.rating;
    },
  },
};
</script>

<style scoped>
li {
  margin: 1rem 0;
  border: 1px solid #ccc;
  padding: 1rem;
}

h3,
p {
  font-size: 1rem;
  margin: 0.5rem 0;
}

.highlight {
  font-weight: bold;
}

.rating--mala {
  color: #b80056;
}

.rating--promedio {
  color: #330075;
}

.rating--excelente {
  color: #008327;
}
</style>
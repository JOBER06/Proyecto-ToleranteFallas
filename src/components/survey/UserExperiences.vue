<template>
  <section>
    <base-card>
      <h2>Experiencias enviadas</h2>
      <div>
        <base-button @click="loadExperiences">Cargar experiencias enviadas</base-button>
      </div>
      <p v-if="isLoading">Cargando...</p>
      <p v-else-if="!isLoading && error">{{ error }}</p>
      <p
        v-else-if="!isLoading && (!results || results.length === 0)"
      >No se encontraron experiencias almacenadas. Comience a agregar algunos resultados de la encuesta primero.</p>
      <ul v-else>
        <survey-result
          v-for="result in results"
          :key="result.id"
          :name="result.name"
          :rating="result.rating"
        ></survey-result>
      </ul>
    </base-card>
  </section>
</template>

<script>
import SurveyResult from './SurveyResult.vue';

export default {
  components: {
    SurveyResult,
  },
  data() {
    return {
      results: [],
      isLoading: false,
      error: null,
    };
  },
  methods: {
    loadExperiences() {
      this.isLoading = true;
      this.error = null;
      fetch('https://proyecto-fd847-default-rtdb.firebaseio.com/surveys.json')
        .then((response) => {
          if (response.ok) {
            return response.json();
          }
        })
        .then((data) => {
          this.isLoading = false;
          const results = [];
          for (const id in data) {
            results.push({
              id: id,
              name: data[id].name,
              rating: data[id].rating,
            });
          }
          this.results = results;
        })
        .catch((error) => {
          console.log(error);
          this.isLoading = false;
          this.error = 'No se pudieron obtener los datos; inténtelo de nuevo más tarde.';
        });
    },
  },
  mounted() {
    this.loadExperiences();
  },
};
</script>

<style scoped>
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
</style>
<template>
  <section>
    <base-card>
      <h2>¿Cuál fue tu experiencia en las clases en línea?</h2>
      <form @submit.prevent="submitSurvey">
        <div class="form-control">
          <label for="name">Nombre</label>
          <input type="text" id="name" name="name" v-model.trim="enteredName" />
        </div>
        <h3>Mi experiencia de aprendizaje fue...</h3>
        <div class="form-control">
          <input type="radio" id="rating-poor" value="Mala" name="rating" v-model="chosenRating" />
          <label for="rating-poor">Mala</label>
        </div>
        <div class="form-control">
          <input
            type="radio"
            id="rating-average"
            value="promedio"
            name="rating"
            v-model="chosenRating"
          />
          <label for="rating-average">Promedio</label>
        </div>
        <div class="form-control">
          <input type="radio" id="rating-great" value="excelente" name="rating" v-model="chosenRating" />
          <label for="rating-great">Excelente</label>
        </div>
        <p
          v-if="invalidInput"
          style="color: red; padding: 10px"
        >Uno o más campos de entrada no son válidos. Por favor, compruebe sus datos proporcionados.</p>
        <p v-if="error">{{ error }}</p>
        <p
          v-if="correcto"
          style="color: green; padding: 10px"
        >Los datos se guardaron correctamente!</p>
        <div>
          <base-button>Enviar</base-button>
        </div>
      </form>
    </base-card>
  </section>
</template>

<script>
export default {
  data() {
    return {
      enteredName: '',
      chosenRating: null,
      invalidInput: false,
      error: null,
      correcto: false
    };
  },
  // emits: ['survey-submit'],
  methods: {
    submitSurvey() {
      if (this.enteredName === '' || !this.chosenRating) {
        this.invalidInput = true;
        return;
      }
      this.invalidInput = false;

       /*this.$emit('survey-submit', {
         userName: this.enteredName,
         rating: this.chosenRating,
       })*/

      this.error = null;
      fetch('https://proyecto-fd847-default-rtdb.firebaseio.com/surveys.json', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: this.enteredName,
          rating: this.chosenRating,
        }),
      })
        .then((response) => {
          if (response.ok) {
            this.correcto = true;
          } else {
            throw new Error('No se pudo guardar la información!');
          }
        })
        .catch((error) => {
          console.log(error);
          this.error = error.message;
        });

      this.enteredName = '';
      this.chosenRating = null;
    },
  },
};
</script>

<style scoped>
.form-control {
  margin: 0.5rem 0;
}

input[type='text'] {
  display: block;
  width: 20rem;
  margin-top: 0.5rem;
}
</style>
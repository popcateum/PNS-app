<script>
  import { library } from '@fortawesome/fontawesome-svg-core'
  import { faCheckCircle } from '@fortawesome/free-solid-svg-icons'
  import { FontAwesomeIcon } from 'fontawesome-svelte'
import { inputNickname } from '../store';
  library.add(faCheckCircle)

  export let title
  export let defaultText
  export let isType
  export let value
</script>

<div class="info">
  <div class="smallTitle">
    <div class="icon">
      <FontAwesomeIcon icon={faCheckCircle} />
    </div>
    <b>{title}</b>
  </div>
  {#if isType}
    <input type="text" bind:value={$inputNickname} placeholder={defaultText} />
  {:else if value}
    <div class="infoContent">
      <div class="data">{value}</div>
    </div>
  {:else}
    <div class="infoContent">
      <div class="default">{defaultText}</div>
    </div>
  {/if}
</div>

<style lang="scss">
  @import '../styles/Info.scss';
</style>

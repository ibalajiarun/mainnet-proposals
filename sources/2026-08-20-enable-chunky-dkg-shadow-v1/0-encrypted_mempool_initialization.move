// Script hash: 95c1eaea
// Initialize on-chain resources for the encrypted mempool stack: ChunkyDKG
// (config + seqnum + state), the epoch force-end watchdog, and the per-block
// decryption key.
//
// Each `initialize` call is a no-op if its resource already exists, so this is
// safe to run even if some of these resources were created previously.
script {
    use aptos_framework::aptos_governance;
    use aptos_framework::chunky_dkg;
    use aptos_framework::chunky_dkg_config;
    use aptos_framework::chunky_dkg_config_seqnum;
    use aptos_framework::decryption;
    use aptos_framework::epoch_timeout_config;

    fun main(proposal_id: u64) {
        let framework = aptos_governance::resolve_multi_step_proposal(
            proposal_id,
            @0x1,
            vector[246u8,66u8,107u8,110u8,245u8,72u8,74u8,75u8,63u8,166u8,235u8,53u8,158u8,51u8,8u8,103u8,71u8,33u8,210u8,41u8,19u8,193u8,138u8,173u8,71u8,71u8,167u8,217u8,187u8,38u8,254u8,121u8,],
        );

        chunky_dkg_config_seqnum::initialize(&framework);
        chunky_dkg_config::initialize(&framework, chunky_dkg_config::new_off());
        chunky_dkg::initialize(&framework);
        epoch_timeout_config::initialize(&framework);
        decryption::initialize(&framework);
    }
}

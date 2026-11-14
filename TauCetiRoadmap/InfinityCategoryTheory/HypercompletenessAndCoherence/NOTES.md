# Notes on the HypercompletenessAndCoherence draft (private)

Problems met while drafting, and how the README handles each.

1. **"By analogy" routes, unpacked.** Three source routes pointed at another proof instead of giving
   one. Each is now written out with its own inputs:
   - §9.1, SAG Prop. 20.4.3.1: the source route said to follow HTT Prop. 6.1.5.2. It is now a direct
     argument: good objects are closed under coproducts (HTT 6.1.5.1) and
     coequalizers (pasting over Q, then HTT 6.1.4.2 for the kernel pair), and HTT 4.4.3.3 closes
     them under all colimits.
     The json cite of InfinityTopoi §4.3 (HTT 6.1.5.2) is dropped, because 6.1.5.2 is not an input.
   - §8.1, SAG Lemma A.3.4.4: the source said "the same argument applies to spheres". The route is
     now: summand inclusions are monomorphisms (disjoint coproducts), so the colimit is a union of
     components, and every component is hit.
   - §11.1, SAG Prop. A.6.2.1: the orthogonality step was "as in HTT Ex. 5.2.8.16". It is now proved
     in a local ∞-pretopos directly. That example concerns ∞-topoi only, so InfinityTopoi §7.2 is
     not cited as its input.
2. **Within-Part forward mentions removed.** Some Checks and Examples in the old CoherentTopoi
   Layers 1–2 cited later sections (Shv(T) locally coherent by §3.3; "Cor. A.2.1.4 below";
   "§3.5 answers Question A.0.6.7"). They were rewritten as self-contained Checks. The answer to
   SAG Question A.0.6.7 is now stated at §9.5 and points back to §8.2. The general n-coherent
   spaces Check sits in §8.3, after Cor. A.2.1.4, which it uses; §8.2 keeps only n = 0 and n = 1.
3. **Notation merged across three sources.** Geometric morphisms are named by f_* in Layers 1–6 and
   by f^* in Layers 8–12. Conventions states that both name the same datum. SAG's X^hyp is written
   X^∧ throughout. CoherentTopoi's backticked mathematics was kept in Layers 7–12, as code spans.
4. **Size.** The README is about 30.1k words, against the plan's 21.8k section words. The extra comes
   from the merged Conventions and supplier contracts. It is within the 40k guide.
5. **Suggested.lean (2026-11-12).** States Layer 7 (Stone duality at the bounded distributive
   lattice level, `LatticeSpectrum`) and the semisimplicial-set part of Layer 11 (§11.2–§11.3);
   everything else needs ∞-topoi and is not statable. Not stated though statable: the semilattice
   level of Stone duality (distributors, `SLat`, SAG Props. A.1.3.3 and A.1.5.2, Cor. A.1.6.6),
   kept out per DESIGN-DECISIONS, CoherentTopoi §2. Added since the old files:
   `LatticeSpectrum.exists_orderIso_opens` (Prop. A.1.2.5 (1)–(2)) and
   `fibration_iff_semisimplicialKanFibration` (Ex. A.5.2.2, combinatorial core). The five
   "proposed" names for ∞-topos headlines are now "planned declaration", renamed to Mathlib style:
   `isIso_postcomp_hypercompletionInclusion` (was `hypercompletion_universal`),
   `postnikovTowersConverge_of_isLocallyOfHomotopyDimensionLE`,
   `isLocallyCoherent_and_isHypercomplete_iff` (was `tfae_isPostnikovComplete`, which named the
   wrong statement), `hasEnoughPoints_of_isLocallyCoherent_of_isHypercomplete`;
   `isInftyConnective_realization` kept.
   Since the sim-firm review (R07) the README no longer prints these five names: none is declared
   in Suggested.lean, whose module docstring names the headlines with their missing carriers.
6. **Sim-firm fixes (2026-11-12).** The old §4.3 (sheaves of spectra are spectrum objects) was a
   specialization of StableInfinityCategories §10.1 and is now a paragraph of §4.1; the old §4.4 is
   §4.3. The HTT cycle 7.2.1.14 → 7.2.1.13 → 6.5.1.20 is not inherited: this Part only cites
   InfinityTopoi §14.1 and §14.4, whose routes break the cycle there.

## Needs Tau Ceti pin bump

Suggested.lean imports no Tau Ceti module. The README's Tau Ceti supplier contracts cite these
names, which exist on Tau Ceti main (bb8823c) but not at the roadmap pin 2fd255d:
`SSet.catInfty`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.IsTerminalVertex`,
`TauCeti.MarkedSSet.markedAnodyneExtensions`, `SSet.RightFibration`. (`SSet.CartesianFibration`
and `SSet.rlp_monomorphisms_iff` exist at the pin.)

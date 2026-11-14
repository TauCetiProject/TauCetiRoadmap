# InfinityTopoi: notes

1. **Departure from the plan (firm round 1, findings 2–3).** Layers 13 and 15 are re-sectioned against
   plans/linear-firm/FINAL-PLAN.md §11: the group-object sections (HTT 7.2.2.5–7.2.2.10, Ex. 7.2.2.2 and
   Grp(Grp(A))) open Layer 13 as §13.1–§13.3, delooping in spaces is §13.4–§13.5, Eilenberg–MacLane objects are
   defined once in §13.6, and Layer 15 has §15.1 (delooping in an ∞-topos) and §15.2 (classification). §12.2 gains
   the identification of homotopy sheaves, truncatedness and connectivity in S. The plan update and the
   renumbering in Prestable and HypercompletenessAndCoherence are in reviews/firm-round1/CROSS.md.
2. **Size.** 43.1k words, over the 40k guideline. The reviewer's seam for a split is after Layer 15; the user
   decides.
3. **GrothendieckTopoi.** An open pull request adding a new roadmap folder; cited by name and section only, in
   Scope and in Checks and Examples. The PR description should name the dependency (CROSS.md).
4. **Suggested.lean (2026-11-12).** States §1.1 (`HasDisjointCoproducts`), §1.2 (HTT 6.1.1.1, two theorems
   on the codomain fibration), §4.1 (`IsLeftExactAt` and the left-exactness criterion), §7.7 (equivalence
   relations and effective epimorphisms in `Type u`), §13.3 (first statement: Grp(Grp(A)) ≌ CommGrp(A) over
   Grp(A), stated for any Cartesian monoidal braided A), §18.2 (frame law ⇔ universal colimits in a complete
   lattice, moved from old LocalicTopoi). The §18.3 covering topology was dropped (sim-firm R01): it is
   GrothendieckTopoi §7.1 `Frame.grothendieckTopology`, cited in §18.3. Repeats InfinityCategoryFoundations §1.2 square/diagram definitions and LimitsAndKanExtensions §8.2
   `evalAt` with the same bodies. Every other headline needs presentability or groupoid objects; the
   docstring lists the missing carriers.

## Needs Tau Ceti pin bump

Present on Tau Ceti main (bb8823c) but not at the roadmap pin 2fd255d:
- `SSet.coslice.IsColimit`, `SSet.slice.IsLimit` (module `Quasicategory/Limit`), used in Suggested.lean
  and the README Conventions and supplier list;
- `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` (modules `Quasicategory/InitialVertex`,
  `Quasicategory/TerminalVertex`), used in Suggested.lean and the README;
- `SSet.catInfty` (module `Quasicategory/CatInfty`) and `SSet.ihomOver` (module
  `SimplicialSet/InternalHom`), cited in the README only.

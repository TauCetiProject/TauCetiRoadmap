# Roadmap: pivotal and spherical categories

Mathlib has rigid monoidal categories and their duals
(`Mathlib/CategoryTheory/Monoidal/Rigid/*`: `ExactPairing`, `HasRightDual`/`HasLeftDual`, the
dual-object notation `Xᘁ` / `ᘁX`, the adjoint mates `fᘁ` / `ᘁf`, `RigidCategory`, and the dual
functors `rightDualFunctor`/`leftDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ`), braided and symmetric categories
(`Monoidal/Braided/*`), the Drinfel'd centre (`Monoidal/Center.lean`, braided), and the rigid
symmetric example `FDRep k G` (`RepresentationTheory/FDRep.lean`, whose `RightRigidCategory`
instance is what Mathlib registers). On `master` it has **no pivotal categories, no
spherical categories, no categorical trace or quantum dimension**, and no cocycle-twisted graded
category, and `Rigid/Basic.lean` carries the standing TODO *"Define pivotal categories
(rigid categories equipped with a natural isomorphism `ᘁᘁ ≅ 𝟙 C`)."*

As this roadmap is written, Jack McKoen has an open Mathlib series building the double-dual functor,
pivotal categories, traces and spherical categories. That series is **not** a reason for this
roadmap to leave those out or to wait: everything here is built in Tau Ceti, starting now. What the
series changes is the *names and shapes* we adopt, so that if it merges we can delete our copy and
import Mathlib's instead of rewriting. See [Relationship to the in-flight Mathlib
series](#relationship-to-the-in-flight-mathlib-series) below, which is binding on everything that
follows.

The target is the theory of **pivotal** and **spherical** categories: the trivialization of the
double-dual functor, the left and right categorical traces and dimensions it makes possible, the
sphericity condition equating them, the two structural examples (`FDRep G` and the pointed categories
`Vec^ω_G`), the classification of pivotal structures by characters of the **universal grading group**
(Drinfeld–Gelaki–Nikshych–Ostrik), and the full **synoptic chart** of tensor categories — the map of
how tensor, rigid, pivotal, spherical, braided, balanced and ribbon categories relate — from
Henriques–Penneys–Tener (*Categorified trace for module tensor categories over braided tensor
categories*, arXiv:1509.02937, Figure 2).

Suggested home: `TauCeti/CategoryTheory/Monoidal/Pivotal/` (mirroring Mathlib's
`Mathlib/CategoryTheory/Monoidal/Rigid/`).

## Relationship to the in-flight Mathlib series

Four open Mathlib pull requests, by Jack McKoen, build the bottom of this roadmap:

- https://github.com/leanprover-community/mathlib4/pull/42145 feat(CategoryTheory/Monoidal/Rigid):
  the double right dual functor is monoidal
- https://github.com/leanprover-community/mathlib4/pull/42150 feat(CategoryTheory/Monoidal/Rigid):
  pivotal categories
- https://github.com/leanprover-community/mathlib4/pull/42191 feat(CategoryTheory/Monoidal/Rigid):
  spherical categories
- https://github.com/leanprover-community/mathlib4/pull/42192 feat(CategoryTheory/Monoidal/Rigid):
  symmetric rigid categories are spherical

Between them they add `Rigid/Pivotal.lean`, `Rigid/Trace.lean` and `Rigid/Spherical.lean`, covering
Layer 0, the core of Layer 1, the trace definitions of Layer 2, and the structures of Layer 7. **None
of it has merged**, so none of it is available to us, so all of it is Tau Ceti work today.

**The policy for this roadmap is:**

1. **Tau Ceti never waits for Mathlib.** ⚠ This is the rule the other three serve, and it overrides
   any reading of them to the contrary. Every item below is a Tau Ceti target that a contributor can
   pick up and build **today**, in Tau Ceti, against Mathlib `master` as it currently is. An open
   upstream PR covering the same ground is *not* a blocker, *not* a reason to leave a gap, and *not*
   a reason to work on something else first. If you need the double-dual functor and #42145 has not
   merged, build the double-dual functor. Nothing on this roadmap is ever "pending upstream".
2. **We adopt upstream's names and shapes now, so the later refactor is cheap.** Citing an open PR
   changes *what we call things and how we shape them*, not *what we build or when*. Layers 0 to 2 and Layer 7
   use `doubleRightDualFunctor`, `PivotalCategory`, `SphericalCategory`, `leftTrace`, `rightTrace`,
   `trace` and upstream's field names because that makes the eventual swap a deletion plus an import
   rather than a rewrite. Where the PRs have not decided something, we decide it here and say so.
3. **Mathlib is upstream and wins, later.** Whatever shape those pull requests land in is the shape
   Tau Ceti ends up with. If Jack renames `PivotalCategory`, moves to a different base class, changes
   the trace formula's packaging, or abandons a PR and someone else lands a different design, **Tau
   Ceti refactors onto whatever lands**, deletes its own copy, and does not argue for its spelling
   against Mathlib's. That refactor is itself in scope for this roadmap. It is work we do *after*
   something lands, never work we anticipate by idling.
4. **Divergences must be deliberate and recorded.** Where this roadmap knowingly differs from an open
   PR, the difference is stated in the relevant layer with the reason. There is exactly one such
   divergence today, recorded in Layer 1 (`PivotalCategory` over `RightRigidCategory` versus
   `RigidCategory`), and it resolves in Mathlib's favour when #42150 lands.

If any wording below still reads as though an open PR supplies something, read it as *"build this
here now, shaped the way that PR shapes it, and delete it in favour of Mathlib's if and when that PR
merges"*. It never means "leave it out", "come back later", or "go do it in Mathlib instead".

Layer 0 is shaped against `#42145` as that branch currently stands, since it is the base of the
other three. Adopting a shape costs nothing, so no target is held back on its account.

**We do not push work to Mathlib.** Everything on this roadmap is built in Tau Ceti and stays in Tau
Ceti. Some of it (the `LeftRigidCategory (FGModuleCat K)` instance of Layer 7, the trace API of Layer
2) would be perfectly good Mathlib material, and Mathlib contributors are welcome to take any of it
at any time; deciding what Mathlib absorbs is entirely theirs, not ours. Do not treat any target here
as "really belonging upstream", do not hold one back for that reason, and do not open Mathlib pull
requests as part of discharging it.

## Standing conventions

- **Generality bar.** The *definitions* — dual functor, double-dual functor, pivotal structure,
  left/right trace and dimension, spherical — are stated for a **general rigid monoidal category** and
  carry no finiteness or semisimplicity hypotheses. The *classification* results — the universal
  grading group `U(C)`, `Aut_⊗(𝟭_C) ≅ Hom(U(C), kˣ)`, the pivotal-structure torsor, the `Vec^ω_G`
  count, Frobenius–Perron dimension — are stated for a **fusion category over an algebraically closed
  field `k` of characteristic 0**. Spell each hypothesis on the result that needs it, as ordinary
  instance arguments (`[Linear k C]`, `[Abelian C]`, semisimplicity, finiteness of the simples,
  `End (𝟙_ C) ≃ₐ[k] k`), and do **not** bundle them into a monolithic `PivotalFusionCategory` class.
  Instance arguments also fix `k` properly, which a `Prop`-valued `IsFusion k C` hypothesis cannot
  do: a proof argument carries no data, so any definition taking one either ignores it or is
  impossible to write. Layers 3 to 6 build the pieces that do not exist yet.
- **Which dual.** Fix the **right dual** `Xᘁ` as primary throughout (matching `rightDualFunctor`,
  `doubleRightDualFunctor`, and `FDRep`'s `rightDual`). In a rigid category left and right duals both
  exist; state the left-handed mirror of each definition and relate the two, but pin right duals so
  signatures do not drift.
- **Base class: `RigidCategory`.** Everything the double dual and both trace formulas need is
  right-handed, so `RightRigidCategory` would be the minimal bar. We nevertheless state the classes
  over `RigidCategory`, matching #42150, because that is what the roadmap will have to refactor onto
  and there is no benefit in diverging first. The consequence for `FDRep k G` (which Mathlib
  registers only as right rigid) is dealt with in Layer 7, not by weakening the class.
- **The double dual lands back in `C`.** The dual functor is `(-)ᘁ : C ⥤ (Cᵒᵖ)ᴹᵒᵖ` (contravariant,
  `ᵒᵖ`, and tensor-reversing, `ᴹᵒᵖ`). Applying it twice and transporting back to `C` gives the
  covariant strong monoidal endofunctor `doubleRightDualFunctor : C ⥤ C`, `X ↦ Xᘁᘁ`. ⚠ `Xᘁᘁ` is just
  how `(Xᘁ)ᘁ` parses; there is nothing to prove at the level of objects, and Mathlib's
  `leftDual_rightDual : ᘁ(Xᘁ) = X` and `rightDual_leftDual : (ᘁX)ᘁ = X` are about the *mixed*
  composites, not about this. The content is the functor's action on morphisms and its monoidal
  structure, and **both are Layer-0 work here**, shaped as #42145 shapes them (`Functor.opMop`,
  `rightDualFunctorMonoidal`,
  `doubleRightDualFunctor` with `deriving Functor.Monoidal`, and `doubleRightDualFunctor_ε` /
  `doubleRightDualFunctor_μ`). Build it here in that shape now, and swap to Mathlib's when #42145
  merges; do not wait, and do not invent a different assembly.
- **The two double duals are inverse, not isomorphic.** ⚠ The double right dual `(-)ᘁᘁ` and the double
  left dual `ᘁᘁ(-)` are **inverse** autoequivalences of a rigid category. A natural isomorphism
  `(-)ᘁᘁ ≅ ᘁᘁ(-)` would force the quadruple dual to be the identity and is **not** available. What is
  canonical is the pair of mixed composites `ᘁ(-)ᘁ ≅ 𝟭_C` and `(ᘁ-)ᘁ ≅ 𝟭_C`, whose object-level
  shadows are the two Mathlib lemmas above. Left and right duals become isomorphic *once a pivotal
  structure is chosen*, which is the content of #42150's `leftDualIsoRightDual` and `dualFunctorIso`,
  not a fact about bare rigid categories.
- **Pivotal = a trivialization of the double dual.** A pivotal structure is a **monoidal** natural
  isomorphism `φ : 𝟭_C ≅ (-)ᘁᘁ`. "Monoidal" is Mathlib's `NatTrans.IsMonoidal` applied to `φ.hom`
  against the `Functor.Monoidal` instance on `doubleRightDualFunctor`; it is part of the
  data-plus-axiom, not optional, and a bare natural iso to the double dual is **not** a pivotal
  structure. The redundant Freyd–Yetter axiom `φ_{Xᘁ} = (φ_X⁻¹)ᘁ` is a **theorem**, not an axiom
  (Selinger, *A survey of graphical languages*, Lem 4.11); prove it rather than assume it.
- **Traces are morphisms `𝟙_C ⟶ 𝟙_C`.** The left and right traces of an endomorphism, and the left and
  right dimensions of an object, are endomorphisms of the unit. Write the type as `𝟙_ C ⟶ 𝟙_ C`,
  matching #42191; `End (𝟙_ C)` is definitionally the same thing (`End X := X ⟶ X`) and may be used
  where the monoid structure is what matters. Over a fusion category `End 𝟙_C ≅ k`, so traces are
  scalars, but the definitions do not need that.
- **Vocabulary.** Use Mathlib's `RigidCategory`, `Xᘁ`, `η_`/`ε_`, `ExactPairing.rightMate`,
  `BraidedCategory`, `SymmetricCategory`, `Center`, `FDRep`, `MonoidHom G Kˣ` for characters, and the
  general `groupCohomology` cochain complex for cocycles. Do not introduce a private dialect where
  Mathlib already has the word, and prefer the *in-flight* spelling (`PivotalCategory`,
  `SphericalCategory`, `leftTrace`, `rightTrace`, `trace`, `doubleRightDualFunctor`) over inventing a
  Tau Ceti one.
- **Explicit pairings over ambient instances.** When a statement needs a dual that is not the ambient
  `HasRightDual` choice, take the `ExactPairing` explicitly and use #42145's
  `ExactPairing.rightMate pX pY f` rather than juggling `letI` instances. Instance arguments are part
  of the elaborated term, so a `rw` against an ambient-instance statement only fires when the
  instances are the same structures; the explicit-pairing form avoids that trap. `tensorOf`,
  `hasRightDual`, `rightHom_ext`, `rightMate_comp_evaluation` and `rightDualTensorIso_hom_naturality`
  are the working set.

## What Mathlib already has (consume)

Everything in this section is on Mathlib `master` today and should simply be used, **except** the
entry marked *(#42145, expected to land)*, which is not yet available and is therefore Tau Ceti work
until it merges. It is listed here rather than under *What is missing* only so that its intended
final shape is in one place.

- **Rigid categories and duals:** `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` —
  `ExactPairing X Y` with `coevaluation`/`evaluation` (notation `η_ X Y : 𝟙_ C ⟶ X ⊗ Y`,
  `ε_ X Y : Y ⊗ X ⟶ 𝟙_ C`), `HasRightDual`/`HasLeftDual`, `Xᘁ`/`ᘁX`, `rightAdjointMate`
  (`fᘁ : Yᘁ ⟶ Xᘁ`), `leftAdjointMate` (`ᘁf`), `RightRigidCategory`/`LeftRigidCategory`/`RigidCategory`,
  and `rightDual_leftDual`/`leftDual_rightDual` (`ᘁXᘁ = X`, `(ᘁX)ᘁ = X` as `rfl`).
- **The dual functors:** `Mathlib/CategoryTheory/Monoidal/Rigid/Functor.lean` —
  `rightDualFunctor`/`leftDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ`, `X ↦ Xᘁ` / `X ↦ ᘁX`. Its `Future work`
  comment ("Show that in a `RigidCategory`, these functors are monoidal equivalences") is still open
  and is the one genuine Layer-0 target left to us.
- **The monoidal dual functor and the double dual — *(#42145, expected to land; build here in the
  meantime)*:**
  `Rigid/Functor.lean` gains `rightDualFunctorCoreMonoidal` / `rightDualFunctorMonoidal` (the dual
  functor is strong monoidal, comparison `rightDualTensorIso`) and
  `doubleRightDualFunctor : C ⥤ C` with a `Functor.Monoidal` instance and the structure-map lemmas
  `doubleRightDualFunctor_ε` / `doubleRightDualFunctor_μ`; `Monoidal/Opposite.lean` gains
  `Functor.opMop` with its monoidal structure. `Rigid/Basic.lean` gains the explicit-pairing API
  (`ExactPairing.tensorOf`, `hasRightDual`, `hasLeftDual`, `rightHom_ext`, `leftHom_ext`,
  `rightMate` with `rightMate_comp_evaluation` / `coevaluation_comp_rightMate` /
  `rightMate_tensor` / `rightMate_associator` / `rightMate_leftUnitor` / `rightMate_rightUnitor`),
  `ExactPairing.unit_coevaluation` / `unit_evaluation`, `rightDualIso_inv` / `rightDualIso_hom_trans`
  / `rightDualIso_tensor` / `rightDualIso_hom_naturality`, `rightDualTensorIso_hom_naturality`, and
  `leftAdjointMate_rightAdjointMate` / `rightAdjointMate_leftAdjointMate`; `Rigid/Braided.lean` gains
  `exactPairingSwap_coevaluation` / `exactPairingSwap_evaluation` and `rightMate_swap_rightMate`.
  **This is all of Layer 0 except the monoidal-equivalence statement above.** Build whatever of it
  Layer 0 needs, in this shape, and delete it in favour of Mathlib's when #42145 merges.
- **Monoidal opposite:** `Mathlib/CategoryTheory/Monoidal/Opposite.lean` — `Cᴹᵒᵖ`, `mop`/`unmop` (the
  tensor-reversing opposite the dual functor lands in), and `opOpEquivalence` with its
  `IsMonoidal` instance.
- **Braided/symmetric:** `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` — `BraidedCategory`
  (field `braiding X Y : X ⊗ Y ≅ Y ⊗ X`, hexagons), `SymmetricCategory`;
  `Mathlib/CategoryTheory/Monoidal/Rigid/Braided.lean` (in a braided category a right dual is a left
  dual).
- **Drinfel'd centre:** `Mathlib/CategoryTheory/Monoidal/Center.lean` — `Center C` (monoidal),
  `braidedCategoryCenter : BraidedCategory (Center C)`, `Center.ofBraided`.
- **The example `FDRep`:** `Mathlib/RepresentationTheory/FDRep.lean` — `FDRep k G` is a
  `MonoidalCategory`, and a `RightRigidCategory` when `G` is a group and `k` a field (via
  `Mathlib/CategoryTheory/Action/Monoidal.lean`'s `RightRigidCategory (Action V H)` and
  `Mathlib/Algebra/Category/FGModuleCat/Basic.lean`'s `rightRigidCategory`), with dual-representation
  lemmas `rightDual_ρ` and `dualTensorIsoLinHom`. `FDRep k G` is also `BraidedCategory` and
  `SymmetricCategory` (via `Action.instSymmetricCategory`). ⚠ Mathlib registers only the
  **right**-rigid instance, so `RigidCategory (FDRep k G)` does not synthesize; supplying it is a
  Layer-7 target. Note that `Rep k G` (all representations, not just finite-dimensional ones) is
  symmetric but has **no** rigid instance of any handedness, and is not a legitimate example anywhere
  in this roadmap; every "the symmetric example" below means `FDRep k G`.
- **Graded objects:** `Mathlib/CategoryTheory/GradedObject/Monoidal.lean` — a monoidal structure on
  `GradedObject β C`, but with the *untwisted* associator; the cocycle twist for `Vec^ω_G` is built
  here.
- **Group cohomology and characters:** `Mathlib/RepresentationTheory/Homological/GroupCohomology/*` —
  the general `groupCohomology A n` from `inhomogeneousCochains` (degree-3 cocycles are reachable
  through the raw differential; the bespoke API in `LowDegree.lean` stops at `cocycles₂`/`H2`, with
  `H1IsoOfIsTrivial : H¹ ≅ Hom(G, A)`). Characters `G → kˣ` are `MonoidHom G Kˣ`; `AddChar` and
  `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` supply Pontryagin duality for finite
  abelian groups.

## What is missing (build here)

Nothing in this list is on Mathlib `master`, so **all of it is Tau Ceti work and all of it can start
today**. Entries marked *(also in flight as #N)* have someone building the same thing upstream: build
them here anyway, in the shape that PR uses, and delete ours when theirs merges. The marking tells
you what to *name* things, not whether to *do* them.

- The double-dual endofunctor `(-)ᘁᘁ : C ⥤ C` and its monoidal structure *(expected from #42145)*.
- The dual functor as a monoidal **equivalence** on a `RigidCategory` (ours; #42145 leaves this in
  `Future work`).
- **Pivotal categories** (`𝟭_C ≅ (-)ᘁᘁ`) *(also in flight as #42150)*, and **pivotal functors**.
- The **left and right categorical trace** *(definitions also in flight as #42191)*, and all of
  their **basic theory** (which no upstream PR touches: #42191 defines the two traces and proves
  nothing about them).
- **Spherical categories** *(also in flight as #42191)*, and the canonical spherical structure on a
  symmetric rigid category *(also in flight as #42192)*.
- **Finite semisimple categories, the simple-class API, the Grothendieck based ring, and
  Perron–Frobenius** (Layers 3 to 5). None of this exists in Mathlib or in any other Tau Ceti
  roadmap, and every fusion-level statement rests on it.
- **Left and right dimension**, **quantum and global dimension**, **Frobenius–Perron dimension**.
- `RigidCategory (FDRep k G)` and the identification of its trace with the linear trace.
- **`Vec^ω_G`** and the classification of its pivotal structures; a degree-3 cocycle API;
  **Frobenius–Schur indicators**; **gradings of a fusion category**, the **adjoint subcategory**, the
  **universal grading group** and `Aut_⊗(𝟭_C) ≅ Hom(U(C), kˣ)`; the synoptic chart of Layer 10. None
  of this overlaps anyone else's work at all.

`Suggested.lean` pins the load-bearing objects (`doubleRightDualFunctor`, `PivotalCategory`,
`SphericalCategory`, `leftTrace`/`rightTrace`/`trace`, `quantumDim`, `VecTwisted`, `IsThreeCocycle`,
`universalGradingGroup`) and
the named milestones below as `sorry`-targets, so each is claimable and the summit statements are
machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types* expressible, its
milestones go into `Suggested.lean` (with `sorry`).

### Layer 0: the dual and double-dual functors

**Build this layer now.** None of it is on Mathlib `master`, so all of it is Tau Ceti work today:
`rightDualFunctorMonoidal` (the dual functor `C ⥤ (Cᵒᵖ)ᴹᵒᵖ` is strong monoidal, with comparison
`rightDualTensorIso`), `doubleRightDualFunctor` (covariant strong monoidal `C ⥤ C`, `X ↦ Xᘁᘁ`, built
through `Functor.opMop`), the structure-map lemmas `doubleRightDualFunctor_ε` /
`doubleRightDualFunctor_μ`, and as much of the explicit-pairing API as the later layers need.

Shape all of it the way #42145 shapes it, and use its names: that PR is the most likely eventual
source, and matching it makes the swap a deletion plus an import. But **do not wait for it**, do not
leave a hole where it would go, and do not invent a different assembly in the meantime. If it merges
first, delete ours; if it does not, we already have the layer.

Beyond what #42145 covers:

- **The dual functor is a monoidal equivalence** on a `RigidCategory`. This is the one item
  `Rigid/Functor.lean` still lists under `Future work`, and #42145 does not close it. It gives
  `doubleRightDualFunctor` as a monoidal autoequivalence as a corollary.
- **The left double dual `ᘁᘁ(-)`, and its correct relationship to the right double dual.**
  ⚠ `(-)ᘁᘁ` and `ᘁᘁ(-)` are **inverse** monoidal autoequivalences; there is no natural iso between
  them (that would force the quadruple dual to be the identity). Build the two canonical mixed
  trivializations, `ᘁ((-)ᘁ) ≅ 𝟭_C` and `(ᘁ(-))ᘁ ≅ 𝟭_C`, upgrading Mathlib's object-level
  `leftDual_rightDual` and `rightDual_leftDual` to monoidal natural isomorphisms, and deduce that the
  two double duals are inverse. Both handednesses are then available, and a pivotal structure on
  either transports to the other; that is what makes it harmless to pin the right-handed one.

### Layer 1: pivotal structures

**Build `PivotalCategory` now, shaped as #42150 shapes it**: a class over `[RigidCategory C]` with fields
`pivotalIso : 𝟭 C ≅ doubleRightDualFunctor C` and `pivotalIso_isMonoidal : NatTrans.IsMonoidal
pivotalIso.hom` (the latter registered as an instance), together with `pivotalExactPairing X :
ExactPairing Xᘁ X`, `leftDualIsoRightDual`, `dualFunctorIso` and
`rightAdjointMate_rightAdjointMate`. Use those names and that shape, and delete ours if and when that
PR merges.

> **On the base class.** Everything the class needs is right-handed, and `pivotalExactPairing` shows
> that a pivotal structure on a merely right rigid category produces left duals, so
> `RightRigidCategory` is the honest bar and applies to `FDRep k G` directly. `#42150` uses
> `RigidCategory`, and we follow it. The cost is one instance, supplied in Layer 7. Build against
> `RigidCategory` until Mathlib says otherwise.

What remains for us:

- **The Freyd–Yetter redundancy** `φ_{Xᘁ} = (φ_X⁻¹)ᘁ`, proved as a lemma (Selinger Lem 4.11), so the
  historical fourth axiom is not carried. Note this is *not* #42150's
  `rightAdjointMate_rightAdjointMate` (`(fᘁ)ᘁ = φ_X⁻¹ ≫ f ≫ φ_Y`), which is about morphisms rather
  than about `φ` at a dual object; state both and relate them.
- **`doubleRightDualFunctor` is a monoidal autoequivalence trivialized by `φ`**, and consequently a
  pivotal category is rigid even when only right rigidity was assumed (the `def` form of the
  divergence above, useful for transporting structures even though the class takes `RigidCategory`).
- **Pivotal functors.** A monoidal functor `F : C ⥤ D` between pivotal categories is **pivotal** when
  `F(φ_X) = δ_{Xᘁ}⁻¹ ≫ (δ_X)ᘁ ≫ φ_{F X}`, where `δ` is the canonical iso `F(Xᘁ) ≅ (F X)ᘁ` that a
  monoidal functor between rigid categories carries (HPT §2.1). The identity and composite of pivotal
  functors are pivotal.
- **The torsor of pivotal structures.** The monoidal natural automorphisms of the identity functor
  form an abelian group `Aut_⊗(𝟭_C)`, and it **acts freely and transitively** on the set of pivotal
  structures whenever that set is nonempty (post-compose `φ` with a monoidal automorphism of `𝟭_C`).
  So pivotal structures form a torsor over `Aut_⊗(𝟭_C)`.

### Layer 2: traces, dimensions, and spherical categories

**Build the two trace definitions and the `SphericalCategory` class now**, shaped as #42191 shapes
them, with `trace` for the common value. Note that #42191 supplies the definitions and **no lemmas
whatsoever about them**, so the whole basic API below is ours no matter what merges upstream, and it
is the most valuable part of this layer.

- **Left and right trace** of `f : X ⟶ X` in a pivotal category, as `𝟙_ C ⟶ 𝟙_ C`
  (Henriques–Penneys–Tener, §2.1). #42191 packages these through
  `pivotalExactPairing X : ExactPairing Xᘁ X`, which absorbs `φ` into the pairing and leaves the
  naive formulas
  - `leftTrace f = η_ Xᘁ X ≫ Xᘁ ◁ f ≫ ε_ X Xᘁ`
  - `rightTrace f = η_ X Xᘁ ≫ f ▷ Xᘁ ≫ ε_ Xᘁ X`

  where the outer coevaluation of one and the evaluation of the other come from the pivotal pairing.
  Unfolding `pivotalExactPairing` recovers HPT's formulas with `φ_X` and `φ_X⁻¹` inserted explicitly,
  and both spellings should be available as lemmas. ⚠ The two traces close with *different*
  evaluations, which is exactly what the `η_`/`ε_` typing enforces; the packaged form makes this hard
  to get wrong, so prefer it.

  Basic theory (the point of a roadmap: the whole basic API, not just the headline, and none of it is
  upstream or in flight): `leftTrace (𝟙 X)` and the dimensions below; **cyclicity**
  `leftTrace (f ≫ g) = leftTrace (g ≫ f)` for `f : X ⟶ Y`, `g : Y ⟶ X`; **monoidality**
  `leftTrace (f ⊗ₘ g) = leftTrace f ≫ leftTrace g` modulo unitors; the value on a scalar
  `a : 𝟙_C ⟶ 𝟙_C` is `a`; `leftTrace f = rightTrace fᘁ`; and `ℤ`- or `k`-linearity where the ambient
  category is preadditive or linear (state the hypothesis, do not assume it globally).
- **Left and right dimension** `dim_L X = leftTrace (𝟙 X)`, `dim_R X = rightTrace (𝟙 X)`, with
  `dim_L X = dim_R Xᘁ`, multiplicativity on `⊗`, `dim_L 𝟙_C = 1`, and additivity on direct sums
  (which needs a preadditive or additive ambient category; carry that hypothesis on the statement
  rather than assuming it for the layer).
- **`SphericalCategory C`** — a pivotal category with `leftTrace f = rightTrace f` for **every**
  endomorphism `f` (equivalently, in the fusion case, `dim_L X = dim_R X` for every object)
  *(also in flight as #42191, with `trace` for the common value)*. Ours either way: that `trace` is
  cyclic, monoidal, and satisfies `dim X = dim Xᘁ`.
### Layer 3: finite semisimple categories

⚠ **Layers 3 to 6 are the foundation of every fusion-level statement in this roadmap, and none of
them exists.** Mathlib has simple objects (`CategoryTheory/Simple.lean`) and Schur's lemma
(`Preadditive/Schur.lean`); `Preadditive/HomOrthogonal.lean` describes itself as "preliminary to
defining semisimple categories". There is no semisimplicity class, no decomposition API, no
Grothendieck ring for a monoidal category, and no Perron–Frobenius theorem. No other Tau Ceti
roadmap covers any of it, so this roadmap owns it. It is the largest and most reusable body of work
here, and nothing in it is specific to pivotal structures.

- **`IsFiniteSemisimpleCategory C`** on a `k`-linear abelian category: every object is a finite
  biproduct of simple objects. The name says *finite* because that is what is meant; there is no
  separate artinian or Karoubian hypothesis, since finite decompositions give finite length and
  abelian categories are already idempotent complete.
- **The decomposition API**, which is the point of the layer and not an afterthought: existence of a
  decomposition, uniqueness of the multiplicities, the multiplicity of a simple `S` in `X` as
  `finrank k (S ⟶ X)`, behaviour on zero and on biproducts, and transfer along an equivalence of
  categories.
- **`SimpleClasses C`**, the isomorphism classes of simple objects, as a subtype of Mathlib's
  `Skeleton C` rather than an opaque type: `{X : Skeleton C // Simple X.out}`, with the class of a
  given simple object, the isomorphism between a simple and its representative, equality of classes
  iff the representatives are isomorphic, exhaustiveness, and invariance under equivalence. ⚠ An
  index type with no such lemmas states nothing: `Fintype` of an underspecified type is not a
  finiteness hypothesis. Note `Simple` needs `HasZeroMorphisms`, so carry it.

### Layer 4: fusion categories and the Grothendieck based ring

- **The fusion hypotheses**, as instance arguments and never as one bundled predicate. Beyond
  `[RigidCategory C]`, `[Abelian C]`, `[Linear k C]`, `IsFiniteSemisimpleCategory C` and
  `[Fintype (SimpleClasses C)]`, three more are needed and are easy to forget:
  - `[MonoidalPreadditive C]` and `[MonoidalLinear k C]`. `Abelian` gives `Preadditive`, but neither
    it nor `Linear k C` says the tensor product is additive or `k`-bilinear; Mathlib keeps those as
    separate classes.
  - `[Simple (𝟙_ C)]`. Without it the setting is *multifusion*, not fusion, and several results below
    are false.
  - Finite-dimensionality of the `Hom` spaces over `k`. Either assume it, or derive it from rigidity
    and finite semisimplicity and then use it; do not leave it implicit.
- **The scalars of the unit.** `End (𝟙_ C) ≃ₐ[k] k` for `k` algebraically closed. ⚠ This needs
  `FiniteDimensional k (End (𝟙_ C))` and is **false** without it: finite-dimensional vector spaces
  over `k(t)`, as a `k`-linear category, are semisimple and rigid with a simple unit, and
  `End (𝟙) = k(t)`. Schur's lemma in Mathlib says the same thing, since
  `finrank_endomorphism_simple_eq_one` carries `[FiniteDimensional 𝕜 (X ⟶ X)]`. State the equivalence
  as the inverse of the canonical map `k → End (𝟙_ C)`, and give the simp lemmas for scalar
  endomorphisms that make traces readable as elements of `k`.
- **The Grothendieck ring as a based ring.** Fix what is being built: a finite-rank based
  `ℤ`-ring, free on `SimpleClasses C`, with the class map from objects, the multiplication given by
  the fusion coefficients, the unit basis element `[𝟙_ C]`, and the involution `[X] ↦ [Xᘁ]`.
- **The fusion coefficients** `N_{ij}^l`, with the convention pinned once:
  `N_{ij}^l = finrank k (X_i ⊗ X_j ⟶ X_l)` for chosen representatives. Prove it equals the
  multiplicity of `X_l` in `X_i ⊗ X_j`, prove the equivalent formula using `X_l ⟶ X_i ⊗ X_j`, and
  fix the fusion-matrix convention `(N_i)_{jl}` explicitly so that later matrix statements are
  unambiguous.
- **Transitivity** of the based ring, in the sense of Etingof–Gelaki–Nikshych–Ostrik: for basis
  elements `X, Z` there is a `Y` with `N` positive in the relevant slot. This is what Layer 5 needs
  and it is a property of rigid fusion categories, not a formality.

### Layer 5: Perron–Frobenius

- **Perron–Frobenius for nonnegative matrices**, then the sharper statements for positive,
  irreducible and primitive matrices: existence of the Perron root as the spectral radius, a
  nonnegative eigenvector, and simplicity of the root together with a strictly positive eigenvector
  in the irreducible case. Mathlib has `Matrix.IsIrreducible` and `Matrix.IsPrimitive`
  (`LinearAlgebra/Matrix/Irreducible/Defs.lean`) as graph-theoretic infrastructure and no theorem.
  There is an open Mathlib series building this, for example
  https://github.com/leanprover-community/mathlib4/pull/39922 feat(PerronFrobenius):
  Perron–Frobenius for irreducible matrices. Build it here regardless; the policy above applies.
- **The unique nonnegative character of a transitive based ring.** ⚠ This is the step that actually
  produces `FPdim`, and it is easy to skip. It is *not* enough to take the Perron root of each
  fusion matrix separately: an individual fusion matrix need not be irreducible, and the matrix of
  the unit is the identity, which is reducible as soon as there is more than one simple class.
  Follow EGNO: apply Perron–Frobenius to multiplication by the sum of all basis elements, whose
  matrix is strictly positive, obtain a common positive eigenvector, show the resulting function is
  the unique character taking nonnegative values on the basis, and only then identify its value at
  `X` with the spectral radius of `N_X`.

### Layer 6: dimensions at the fusion bar

- **Frobenius–Perron dimension** `FPdim`, defined as the value at `[X]` of the character from
  Layer 5, with `FPdim (X ⊗ Y) = FPdim X * FPdim Y`, `0 ≤ FPdim X`, and
  `FPdim X = 0 ↔ IsZero X`. ⚠ `FPdim X > 0` for all `X` is false: a fusion category has a zero
  object. `FPdim` needs no characteristic hypothesis, so do not carry one here.
- **Global dimension** `dim C = Σ_i dim(X_i) · dim(X_iᘁ)` summed over `SimpleClasses C`, and its
  independence of the pivotal structure.
- **Comparison with the categorical dimension.** `|dim_L X| ≤ FPdim X` needs an absolute value,
  which an abstract algebraically closed field does not carry, so state it for `k = ℂ`.
- **Pseudo-unitarity**, as a *property* (`dim C = FPdim C`) and not something every fusion category
  enjoys. Define it, then construct under that hypothesis the canonical spherical structure with
  `dim X = FPdim X`.

### Layer 7: `FDRep G` is pivotal and spherical (the standard structure)

#42192 shortens this layer to almost nothing, and that is a good outcome rather than a loss. It
proves that **any** rigid symmetric monoidal category carries a canonical pivotal structure (the
Drinfeld isomorphism `drinfeldIso`, monoidal exactly because the braiding is symmetric) and that it
is spherical. `FDRep k G` is already `SymmetricCategory` in Mathlib, so the standard structure is a
corollary rather than a hand construction. Do **not** build a bespoke `FDRep` double-duality
isomorphism.

- **Register `RigidCategory (FDRep k G)`.** Mathlib registers only `RightRigidCategory (FGModuleCat K)`,
  so `RigidCategory (FDRep k G)` does not synthesize and Layer 1's class does not apply.
  `BraidedCategory.rigidCategoryOfRightRigidCategory` produces it in one line from the existing
  symmetric and right-rigid instances, but it is deliberately not an instance. The right fix is a
  genuine `LeftRigidCategory (FGModuleCat K)`, since the dual vector space is canonical there and
  should not be routed through the braiding. Build it here, in Tau Ceti, as part of this layer.
- **The standard pivotal and spherical structures** on `FDRep k G` are then the instances from #42192
  applied to the symmetric structure. State them, and prove they agree with the classical
  finite-dimensional double-duality isomorphism `V ≅ V**`, which is what a reader expects "the
  standard pivotal structure" to mean.
- **Traces are ordinary traces.** `trace f` is the ordinary linear trace of `f` (a scalar in
  `k = End 𝟙_{FDRep k G}`), and `dim V = finrank k V`: the quantum dimension is the vector-space
  dimension. The symmetric-category trace formula
  `trace f = η_ X Xᘁ ≫ f ▷ Xᘁ ≫ (β_ X Xᘁ).hom ≫ ε_ X Xᘁ` is the natural starting point, and is a
  named target here regardless of whether #42192 ever names it (that PR currently has it as an
  anonymous `example`).
- These are the acceptance criteria that keep Layers 1–2 honest, and they remain so even though the
  structures now come for free: the content has moved from "construct the pivotal structure" to
  "identify its trace with the linear trace", which is the part that actually tests Layer 2's API.

### Layer 8: the pointed categories `Vec^ω_G` and their pivotal structures

- **`Vec^ω_G`.** For a group `G`, a field `k`, and a normalized 3-cocycle `ω ∈ Z³(G, kˣ)`, the
  category of `G`-graded finite-dimensional `k`-vector spaces with associator on the simple objects
  `δ_g` given by multiplication by `ω(g,h,k)`. It is a **pointed tensor category** — a **fusion**
  category exactly when `G` is finite: simple objects `{δ_g}_{g∈G}`, `δ_g ⊗ δ_h = δ_{gh}`, unit `δ_e`,
  and rigidity with `δ_gᘁ = δ_{g⁻¹}` (structure maps built from `ω`), so `δ_gᘁᘁ = δ_g`. ⚠ The
  underlying objects must be **finitely supported** graded objects, not all of
  `GradedObject G (FGModuleCat k)`: that type is the full function type `G → FGModuleCat k`, and for
  infinite `G` the convolution tensor product is a coproduct over a fibre equivalent to `G`, which
  `FGModuleCat` does not have. Pin the support condition in the definition. The pivotal
  classification below then holds for any `G`; the fusion-level invariants (Frobenius–Perron and
  global dimension) need `G` finite.
  - Build a **degree-3 cocycle** predicate `IsThreeCocycle ω` and the normalization
    conditions from the general `groupCohomology`/`inhomogeneousCochains` differential (Mathlib's
    bespoke API stops at degree 2); cohomologous cocycles give monoidally equivalent categories.
- **Classification of pivotal structures on `Vec^ω_G`.** The double dual `(-)ᘁᘁ` is naturally
  isomorphic to the identity by a **canonical** scalar-valued iso determined by `ω`; a pivotal
  structure is that canonical one twisted by a **character**, so pivotal structures on `Vec^ω_G` form
  a **torsor over `Hom(G, kˣ)`** (in particular a pivotal structure always exists). Identify the
  **spherical** ones among them.
- **Frobenius–Schur indicators.** Define the Ng–Schauenburg indicators `ν_n` from the pivotal
  structure, for `n` a **positive** natural (use `ℕ+`, or carry `0 < n`), and compute them on the
  `δ_g`. They are invariants of the pivotal structure; they do **not** determine it in general. For
  `G = ℤ`, `Hom(𝟙, δ_g^{⊗n}) = 0` for every nontrivial `δ_g` and every `n > 0`, so no collection of
  indicators recovers a character `ℤ → kˣ`. State the hypotheses under which they are complete.
  ⚠ This roadmap owns only the categorical `ν_n`. The finite-group `ν₂` belongs to
  [`RepresentationTheory/CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md), which
  already asks that its `FDRep` indicator agree with the categorical one; that agreement theorem is
  the contribution here, not a second definition.

### Layer 9: gradings, the universal grading group, and the DGNO classification

- **Grading of a fusion category by a group.** A faithful grading `C = ⊕_{g∈G} C_g` with
  `C_g ⊗ C_h ⊆ C_{gh}` and `𝟙_C ∈ C_e`; the **adjoint subcategory** `C_ad` (the subcategory generated
  by `X ⊗ Xᘁ`), which is the trivial component of the universal grading.
- **The universal grading group** `U(C)`: the group carrying the finest faithful grading, through
  which every grading of `C` factors, with trivial component `C_ad` (Gelaki–Nikshych;
  Drinfeld–Gelaki–Nikshych–Ostrik, *On braided fusion categories I*, §2–3).
- **The classification theorem.** For a fusion category over an algebraically closed field of
  characteristic 0, `Aut_⊗(𝟭_C) ≃* Hom(U(C), kˣ)` — the monoidal natural automorphisms of the
  identity are exactly the characters of the universal grading group, as groups and not merely as
  types. Combined with Layer 1's torsor: **if `C` admits a pivotal structure at all**, its pivotal
  structures form a torsor over `Hom(U(C), kˣ)`. ⚠ Carry that hypothesis explicitly. Whether every
  fusion category admits a pivotal structure is open (it is why Etingof–Nikshych–Ostrik's
  pivotalization construction exists), so an unconditional torsor statement would assert a
  conjecture.
- **Recovering the examples.** `U(Vec^ω_G) = G`, recovering Layer 8's `Hom(G, kˣ)` count; and the
  standard pivotal structure of Layer 7 as a distinguished point of the corresponding torsor.

### Layer 10: the synoptic chart of tensor categories (HPT Figure 2)

State the whole chart — the definitions of the remaining nodes and every arrow between them.

- **The nodes.** In addition to `MonoidalCategory` (tensor), `RigidCategory` (rigid),
  `PivotalCategory`, `SphericalCategory` above:
  - **Braided** (`BraidedCategory`, consume) and its rigid, balanced, and pivotal combinations;
  - **`BalancedCategory`** = braided with a **twist** `θ_X : X ≅ X` natural in `X` and satisfying
    `θ_{X⊗Y} = (β_{Y,X} ∘ β_{X,Y}) ∘ (θ_X ⊗ θ_Y)`. ⚠ Do not call this `Balanced`: Mathlib already has
    `CategoryTheory.Balanced` (mono plus epi implies iso), and the clash is silent because the local
    declaration wins.
  - **`RibbonCategory`** = balanced and rigid with `θ_{Xᘁ} = (θ_X)ᘁ`.
- **Forgetful and axiom-imposing arrows.** The plain forgetful maps (braided → tensor, rigid →
  tensor, balanced → braided, pivotal → rigid, spherical → pivotal as a full subclass by imposing
  `leftTrace = rightTrace`, ribbon → balanced+rigid), matching the two arrow types of Figure 2
  (forget data / impose axioms). ⚠ #42192 registers `symmetricPivotalCategory` and
  `symmetricSphericalCategory` as global instances, so on a rigid symmetric category the pivotal and
  spherical structures are already chosen; arrows out of the symmetric node must be stated against
  those instances rather than against an arbitrary structure.
- **The Drinfel'd-centre arrows.** `Z(-)` sends each row to its braided enrichment:
  `Z(tensor)` is braided, `Z(rigid)` is braided+rigid, `Z(pivotal)` is braided+pivotal, and
  `Z(spherical)` is **ribbon** (Müger). ⚠ State this by *constructing* the induced twist on `Z(C)`
  from the spherical structure and proving that twist ribbon. A statement quantifying over an
  arbitrary balanced structure on `Z(C)` is false: given a ribbon twist `θ` and a monoidal natural
  automorphism `u` of the identity, `θ · u` is again a twist, and it is ribbon only when
  `u_{Xᘁ} = (u_X)ᘁ`. Consume `Center C` and `braidedCategoryCenter`; the key
  content is **HPT Proposition 2.3**, that a pivotal structure on `C` induces one on `Z(C)` (dual of
  `(a, eₐ)` is `(aᘁ, …)`, and `φ` lifts), and the sphericity/ribbon upgrade.
- **The central equivalence** `balanced+rigid ≃ braided+pivotal`. A braided rigid category is pivotal
  iff it is balanced, via the **explicit twist** built from the braiding and the pivotal structure
  (HPT eq (3)): `θ_X = (𝟙_X ⊗ ε_{Xᘁ}) ∘ (β_{Xᘁᘁ, X} ⊗ 𝟙_{Xᘁ}) ∘ (𝟙_{Xᘁᘁ} ⊗ η_X) ∘ φ_X`. There are
  two such equivalences (the two ways of going between the notions); fix the one given by eq (3) and
  state the round-trips. Ribbon corresponds to the spherical pivotal structures under it.

---

## Worked examples (acceptance criteria)

- **`FDRep G` is spherical** with `dim V = finrank k V` and `tr = ` ordinary trace (Layer 7).
- **`Vec^ω_G` pivotal structures ↔ `Hom(G, kˣ)`**, a torsor; a pivotal structure always exists; the
  spherical ones are identified (Layer 8).
- **Frobenius–Schur indicators** of the `δ_g` in `Vec^ω_G`, and of the irreducibles in `FDRep G`,
  computed from the pivotal structure (Layers 7–8).
- **The twist from a braided pivotal category** (eq (3)) recovers the balanced/ribbon structure, and
  on a symmetric example (`FDRep k G` with the standard pivotal structure of Layer 7) gives the
  trivial twist `θ = 𝟙` (Layer 10).
- **`Z(spherical)` is ribbon** on a small pointed example (Layer 10).
- **`U(Vec^ω_G) = G`** and the induced torsor count matches Layer 8 (Layer 9).

## Ordering

The layer numbers are the dependency order and nothing in a layer refers forward to a later one.

Layer 0 (the double-dual functor) is the foundation, and Layers 1 and 2 (pivotal structures, then
traces and spherical categories) are the categorical core. Layers 3 to 5 are independent of all of
that: finite semisimple categories, then fusion categories and the Grothendieck based ring, then
Perron–Frobenius. They can be built in parallel with Layers 0 to 2 by someone who prefers algebra to
string diagrams, and Layer 6 is where the two strands meet, since its dimensions need the traces of
Layer 2 and the based-ring character of Layer 5.

Layers 7 and 8 are the two examples that keep the core honest and can proceed in parallel once
Layers 1 and 2 land; Layer 7 needs nothing from Layers 3 to 6, and Layer 8 needs them only for its
fusion-level invariants. Layer 9 (universal grading) generalizes both examples and consumes Layer 4.
Layer 10 (the synoptic chart) depends on the braided, balanced and ribbon definitions and the
Drinfel'd centre, and on Layers 1 and 2 for the pivotal and spherical nodes; the central equivalence
and the centre arrows are its most technical part.

**Sequencing against the Mathlib series.** The four open PRs change nothing about this ordering.
Every layer is startable now, and a contributor who wants the Layer 0 or Layer 1 definitions should
build them here, in the shape those PRs use, rather than treating the PRs as a reason to pick
something else. The only thing the overlap affects is that those particular items are the ones most
likely to be deleted later in favour of Mathlib's, which is a cheap outcome and not a cost worth
steering around. If you would rather spend effort where a later deletion is least likely, the Layer 2
trace API (#42191 defines the two traces and proves nothing about them), the
`LeftRigidCategory (FGModuleCat K)` instance of Layer 7, the monoidal-equivalence statement left open
in `Rigid/Functor.lean`, and the whole of Layers 8 to 10 all qualify.

## References

### In-flight Mathlib work

- J. McKoen, https://github.com/leanprover-community/mathlib4/pull/42145 (the double right dual
  functor is monoidal), https://github.com/leanprover-community/mathlib4/pull/42150 (pivotal
  categories), https://github.com/leanprover-community/mathlib4/pull/42191 (spherical categories),
  https://github.com/leanprover-community/mathlib4/pull/42192 (symmetric rigid categories are
  spherical). See [Relationship to the in-flight Mathlib
  series](#relationship-to-the-in-flight-mathlib-series).
- The Perron–Frobenius series, e.g.
  https://github.com/leanprover-community/mathlib4/pull/39922 (Perron–Frobenius for irreducible
  matrices) and https://github.com/leanprover-community/mathlib4/pull/39925 (simplicity of the
  Perron root). Layer 5 is shaped against that series. Build the results here regardless, and
  replace them if it lands.

### Mathematical references

- A. Henriques, D. Penneys, J. Tener, *Categorified trace for module tensor categories over braided
  tensor categories*, arXiv:1509.02937 — §2.1 (flavours of tensor category, the trace formulas),
  §2.2 (the Drinfel'd centre, Prop 2.3), §2.3 (the **synoptic chart**, Figure 2), eq (3) (the twist
  of a braided pivotal category), Appendix A.2 (braided pivotal categories).
- P. Freyd, D. Yetter, *Braided compact closed categories with applications to low-dimensional
  topology*, Adv. Math. 77 (1989) — the original definition of pivotal categories.
- P. Selinger, *A survey of graphical languages for monoidal categories* — the flavours of monoidal
  category and the redundancy of the fourth pivotal axiom (Lem 4.11).
- P. Etingof, D. Nikshych, V. Ostrik, *On fusion categories*, Ann. of Math. 162 (2005) — pivotal and
  spherical structures on fusion categories, dimensions, the Drinfel'd centre.
- V. Drinfeld, S. Gelaki, D. Nikshych, V. Ostrik, *On braided fusion categories I*, Selecta Math.
  16 (2010) — the universal grading group, the adjoint subcategory, and
  `Aut_⊗(𝟭) ≅ Hom(U(C), kˣ)`.
- S.-H. Ng, P. Schauenburg, *Higher Frobenius–Schur indicators for pivotal categories* — the
  indicators computed in Layers 7–8.
- M. Müger, *From subfactors to categories and topology II*, J. Pure Appl. Algebra 180 (2003) — the
  centre of a spherical category is ribbon/modular.
- P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS (2015) — the textbook
  reference for all of the above (Ch. 4 duals and pivotal/spherical, Ch. 3 gradings, Ch. 7
  Frobenius–Perron and global dimension).

## Acknowledgements

This roadmap organizes its synoptic chart around Figure 2 of Henriques–Penneys–Tener
(arXiv:1509.02937), whose §2 background on the flavours of tensor category, the exact trace formulas,
and the two equivalences between balanced-rigid and braided-pivotal categories it follows closely.

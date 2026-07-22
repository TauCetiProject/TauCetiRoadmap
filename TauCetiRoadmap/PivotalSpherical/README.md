# Roadmap: pivotal and spherical categories

Mathlib has rigid monoidal categories and their duals
(`Mathlib/CategoryTheory/Monoidal/Rigid/*`: `ExactPairing`, `HasRightDual`/`HasLeftDual`, the
dual-object notation `Xᘁ` / `ᘁX`, the adjoint mates `fᘁ` / `ᘁf`, `RigidCategory`, and the dual
functors `rightDualFunctor`/`leftDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ`), braided and symmetric categories
(`Monoidal/Braided/*`), the Drinfel'd centre (`Monoidal/Center.lean`, braided), and the rigid
symmetric example `FDRep k G` (`RepresentationTheory/FDRep.lean`, whose `RightRigidCategory`
instance is what Mathlib registers). It has **no pivotal categories, no
spherical categories, no categorical trace or quantum dimension**, and no cocycle-twisted graded
category. The file `Rigid/Basic.lean` even carries the standing TODO *"Define pivotal categories
(rigid categories equipped with a natural isomorphism `ᘁᘁ ≅ 𝟙 C`)."* This roadmap discharges that
TODO and builds the theory it opens onto.

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

## Standing conventions

- **Generality bar.** The *definitions* — dual functor, double-dual functor, pivotal structure,
  left/right trace and dimension, spherical — are stated for a **general rigid monoidal category** and
  carry no finiteness or semisimplicity hypotheses. The *classification* results — the universal
  grading group `U(C)`, `Aut_⊗(𝟭_C) ≅ Hom(U(C), kˣ)`, the pivotal-structure torsor, the `Vec^ω_G`
  count, Frobenius–Perron dimension — are stated for a **fusion category over an algebraically closed
  field `k` of characteristic 0**. Spell each hypothesis on the result that needs it; do **not**
  bundle a monolithic `PivotalFusionCategory` class. Mathlib has no `FusionCategory` yet, so state the
  hypotheses that make up "fusion" (rigid, `k`-linear, semisimple, finitely many simple objects,
  `End 𝟙_C ≅ k`) explicitly on the results, and factor out a `FusionCategory` predicate only if a
  later refactor shows it earns its keep.
- **Which dual.** Fix the **right dual** `Xᘁ` as primary throughout (matching `rightDualFunctor` and
  `FDRep`'s `rightDual`). In a rigid category left and right duals both exist; state the left-handed
  mirror of each definition and relate the two, but pin right duals so signatures do not drift. The
  double dual `Xᘁᘁ`, the pivotal structure, and both trace formulas use only right duals, so the Lean
  definitions are stated over `RightRigidCategory` (which is also all Mathlib registers for `FDRep`);
  "rigid" below always means the usual two-sided notion, of which this is the right-handed presentation.
- **The double dual lands back in `C`.** The dual functor is `(-)ᘁ : C ⥤ (Cᵒᵖ)ᴹᵒᵖ` (contravariant,
  `ᵒᵖ`, and tensor-reversing, `ᴹᵒᵖ`). The **double dual** is obtained by applying it twice and then
  transporting along the canonical monoidal equivalences `(Dᵒᵖ)ᵒᵖ ≃ D` and `(Dᴹᵒᵖ)ᴹᵒᵖ ≃ D` to return
  to `C`; it is a covariant strong monoidal endofunctor `(-)ᘁᘁ : C ⥤ C`. ⚠ These two identifications
  are not bookkeeping to be hand-waved: on objects `Xᘁᘁ = (Xᘁ)ᘁ` is `rfl` (Mathlib's
  `leftDual_rightDual`/`rightDual_leftDual`), but the **functor** `(-)ᘁᘁ` and its monoidal structure
  must be assembled through the equivalences, and that assembly is Layer 0, not assumed.
- **Pivotal = a trivialization of the double dual.** A pivotal structure is a **monoidal** natural
  isomorphism `φ : 𝟭_C ≅ (-)ᘁᘁ`. "Monoidal" (that `φ_{X⊗Y}` agrees with `φ_X ⊗ φ_Y` through the
  monoidal comparison of `(-)ᘁᘁ`) is part of the data-plus-axiom, not optional; a bare natural iso to
  the double dual is **not** a pivotal structure. The redundant Freyd–Yetter axiom
  `φ_{Xᘁ} = (φ_X⁻¹)ᘁ` is a **theorem**, not an axiom (Selinger, *A survey of graphical languages*,
  Lem 4.11); prove it rather than assume it.
- **Traces live in `End 𝟙_C`.** The left and right traces of an endomorphism, and the left and right
  dimensions of an object, are elements of the endomorphism monoid of the unit, `End 𝟙_C`. Over a
  fusion category `End 𝟙_C ≅ k`, so they are scalars, but the definitions do not need that.
- **Vocabulary.** Use Mathlib's `RigidCategory`, `Xᘁ`, `η_`/`ε_`, `BraidedCategory`,
  `SymmetricCategory`, `Center`, `FDRep`, `MonoidHom G Kˣ` for characters, and the general
  `groupCohomology` cochain complex for cocycles. Do not introduce a private dialect where Mathlib
  already has the word.

## What Mathlib already has (consume)

- **Rigid categories and duals:** `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` —
  `ExactPairing X Y` with `coevaluation`/`evaluation` (notation `η_ X Y : 𝟙_ C ⟶ X ⊗ Y`,
  `ε_ X Y : Y ⊗ X ⟶ 𝟙_ C`), `HasRightDual`/`HasLeftDual`, `Xᘁ`/`ᘁX`, `rightAdjointMate`
  (`fᘁ : Yᘁ ⟶ Xᘁ`), `leftAdjointMate` (`ᘁf`), `RightRigidCategory`/`LeftRigidCategory`/`RigidCategory`,
  and `rightDual_leftDual`/`leftDual_rightDual` (`ᘁXᘁ = X`, `(ᘁX)ᘁ = X` as `rfl`).
- **The dual functors:** `Mathlib/CategoryTheory/Monoidal/Rigid/Functor.lean` —
  `rightDualFunctor`/`leftDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ`, `X ↦ Xᘁ` / `X ↦ ᘁX`. Its own `Future work`
  comment ("Show that in a `RigidCategory`, these functors are monoidal equivalences") is a Layer-0
  sub-target.
- **Monoidal opposite:** `Mathlib/CategoryTheory/Monoidal/Opposite.lean` — `Cᴹᵒᵖ`, `mop`/`unmop` (the
  tensor-reversing opposite the dual functor lands in).
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
  lemmas `rightDual_ρ` and `dualTensorIsoLinHom`. ⚠ Mathlib registers the **right**-rigid instance;
  `FDRep k G` is rigid (both sides) mathematically, but the full `RigidCategory` instance is not
  upstream, so the Lean definitions here are stated over `RightRigidCategory` (right duals suffice for
  the double dual and both traces). `Rep k G` is `SymmetricCategory` (`Rep/Basic.lean`).
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

The double-dual endofunctor `(-)ᘁᘁ : C ⥤ C` and its monoidal structure; **pivotal categories**
(`𝟭_C ≅ (-)ᘁᘁ`) and pivotal functors; the **left/right categorical trace and dimension** and their
basic theory; **spherical categories**; **quantum/global dimension** and **Frobenius–Perron
dimension**; **`Vec^ω_G`** (pointed fusion categories with a cocycle-twisted associator) and the
classification of its pivotal structures; **gradings of a fusion category by a group**, the **adjoint
subcategory** and the **universal grading group**, and the theorem identifying
`Aut_⊗(𝟭_C)` with `Hom(U(C), kˣ)`; a degree-3 cocycle API; and **Frobenius–Schur indicators**. None
of this is upstream.

`Suggested.lean` pins the load-bearing objects (`doubleDualFunctor`, `Pivotal`, `Spherical`,
`leftTrace`/`rightTrace`, `quantumDim`, `VecTwisted`, `IsThreeCocycle`, `universalGradingGroup`) and
the named milestones below as `sorry`-targets, so each is claimable and the summit statements are
machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types* expressible, its
milestones go into `Suggested.lean` (with `sorry`).

### Layer 0: the dual and double-dual functors

- **The dual functor as a strong monoidal functor.** Upgrade `rightDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ` to a
  strong monoidal functor (the comparison `Xᘁ ⊗ Yᘁ ≅ (Y ⊗ X)ᘁ` from `rightDualTensorIso`), and prove
  it is a monoidal **equivalence** on a `RigidCategory` (the `Future work` note in `Rigid/Functor.lean`).
- **The double-dual endofunctor** `(-)ᘁᘁ : C ⥤ C`. Compose the dual functor with itself and transport
  along the canonical monoidal equivalences `(Dᵒᵖ)ᵒᵖ ≃ D`, `(Dᴹᵒᵖ)ᴹᵒᵖ ≃ D` to land back in `C`.
  Establish it is a **covariant strong monoidal** endofunctor, and a monoidal equivalence on a rigid
  category. ⚠ On objects `Xᘁᘁ = (Xᘁ)ᘁ` and `ᘁᘁX = X` hold as `rfl`, but the functor's action on
  morphisms and its monoidal coherence come from the two equivalences and are the actual content.
- **The left double dual `ᘁᘁ(-)`** and the canonical natural iso `(-)ᘁᘁ ≅ ᘁᘁ(-)` relating the right
  and left double duals, so both handednesses are available and pivotal structures can be stated on
  either.

### Layer 1: pivotal structures

- **`Pivotal C`** — the data of a **monoidal natural isomorphism** `φ : 𝟭_C ≅ (-)ᘁᘁ` on a rigid
  category: components `φ_X : X ≅ Xᘁᘁ`, natural in `X`, and monoidal
  (`φ_{X⊗Y}` compatible with `φ_X ⊗ φ_Y` under the monoidal structure of `(-)ᘁᘁ`), together with the
  unit compatibility. This is the definition discharging the `Rigid/Basic.lean` TODO.
- **The Freyd–Yetter redundancy** `φ_{Xᘁ} = (φ_X⁻¹)ᘁ`, proved as a lemma (Selinger Lem 4.11), so the
  historical fourth axiom is not carried.
- **Pivotal functors.** A monoidal functor `F : C ⥤ D` between pivotal categories is **pivotal** when
  `F(φ_X) = δ_{Xᘁ}⁻¹ ≫ (δ_X)ᘁ ≫ φ_{F X}`, where `δ` is the canonical iso `F(Xᘁ) ≅ (F X)ᘁ` that a
  monoidal functor between rigid categories carries (HPT §2.1). The identity and composite of pivotal
  functors are pivotal.
- **The torsor of pivotal structures.** The monoidal natural automorphisms of the identity functor
  form an abelian group `Aut_⊗(𝟭_C)`, and it **acts freely and transitively** on the set of pivotal
  structures whenever that set is nonempty (post-compose `φ` with a monoidal automorphism of `𝟭_C`).
  So pivotal structures form a torsor over `Aut_⊗(𝟭_C)`.

### Layer 2: traces, dimensions, and spherical categories

- **Left and right trace** of `f : X ⟶ X` in a pivotal category, valued in `End 𝟙_C`
  (Henriques–Penneys–Tener, §2.1), written with Mathlib's convention `η_ A B : 𝟙 ⟶ A ⊗ B`,
  `ε_ A B : B ⊗ A ⟶ 𝟙` (for `[ExactPairing A B]`):
  - `tr_L f = ε_ X (Xᘁ) ∘ (𝟙_{Xᘁ} ⊗ f) ∘ (𝟙_{Xᘁ} ⊗ φ_X⁻¹) ∘ η_ (Xᘁ) (Xᘁᘁ)` — coevaluate the pair
    `(Xᘁ, Xᘁᘁ)`, land in `Xᘁ ⊗ X` after `φ_X⁻¹` and `f`, and close with the evaluation `ε_ X (Xᘁ)`
    of the pair `(X, Xᘁ)`; and the mirror
  - `tr_R f = ε_ (Xᘁ) (Xᘁᘁ) ∘ (φ_X ⊗ 𝟙_{Xᘁ}) ∘ (f ⊗ 𝟙_{Xᘁ}) ∘ η_ X (Xᘁ)` — land in `Xᘁᘁ ⊗ Xᘁ`
    after `φ_X`, and close with the evaluation `ε_ (Xᘁ) (Xᘁᘁ)` of the pair `(Xᘁ, Xᘁᘁ)`.
  ⚠ The closing evaluations differ between the two traces: `tr_L` closes with the evaluation of
  `(X, Xᘁ)` and `tr_R` with that of `(Xᘁ, Xᘁᘁ)`; keeping them straight is exactly what the Mathlib
  `η_`/`ε_` typing enforces.

  Basic theory (the point of a roadmap — the whole basic API, not just the headline): `ℤ`/`k`-linearity
  where applicable; **cyclicity** `tr_L (g ∘ f) = tr_L (f ∘ g)`; **monoidality**
  `tr_L (f ⊗ g) = tr_L f · tr_L g`; the value of a scalar `a : 𝟙_C ⟶ 𝟙_C` is `a`; and
  `tr_L f = tr_R (fᘁ)`.
- **Left and right dimension** `dim_L X = tr_L (𝟙 X)`, `dim_R X = tr_R (𝟙 X)`, with
  `dim_L X = dim_R (Xᘁ)`, additivity on direct sums, multiplicativity on `⊗`, and `dim_L 𝟙_C = 1`.
- **`Spherical C`** — a pivotal category with `tr_L f = tr_R f` for **every** endomorphism `f`
  (equivalently, in the fusion case, `dim_L X = dim_R X` for every object). The common value is the
  **spherical trace** `tr` and the **spherical dimension** `dim`; it is symmetric, cyclic, monoidal,
  and satisfies `dim X = dim (Xᘁ)`.
- **Quantum/global dimension.** For a fusion category, the **global dimension**
  `dim C = Σ_i dim(X_i) · dim(X_iᘁ)` over representatives `X_i` of the simple objects (independent of
  the pivotal structure), and, at the fusion bar, the **Frobenius–Perron dimension** `FPdim` (the
  Perron–Frobenius eigenvalue of the fusion matrices) with `FPdim X > 0`, `FPdim(X⊗Y)=FPdim X · FPdim Y`.
  State the comparison `|dim_L X| ≤ FPdim X` and **pseudo-unitarity** (`dim = FPdim` for a suitable
  spherical structure) as targets.

### Layer 3: `FDRep G` is pivotal and spherical (the standard structure)

- **The standard pivotal structure.** For `G` a group and `k` a field, the canonical evaluation
  isomorphism `V ≅ Vᘁᘁ` of finite-dimensional representations (the finite-dimensional double-duality
  iso, `G`-equivariant) is a monoidal natural isomorphism `𝟭 ≅ (-)ᘁᘁ`: the **standard** pivotal
  structure on `FDRep k G`.
- **Traces are ordinary traces.** Under it, `tr_L f = tr_R f` is the ordinary linear trace of `f` (a
  scalar in `k = End 𝟙_{FDRep k G}`), so `FDRep k G` is **spherical**, and `dim V = finrank k V` — the
  quantum dimension is the ordinary vector-space dimension.
- These are the acceptance criteria that keep Layers 1–2 honest.

### Layer 4: the pointed categories `Vec^ω_G` and their pivotal structures

- **`Vec^ω_G`.** For a group `G`, a field `k`, and a normalized 3-cocycle `ω ∈ Z³(G, kˣ)`, the
  category of `G`-graded finite-dimensional `k`-vector spaces with associator on the simple objects
  `δ_g` given by multiplication by `ω(g,h,k)`. It is a **pointed tensor category** — a **fusion**
  category exactly when `G` is finite: simple objects `{δ_g}_{g∈G}`, `δ_g ⊗ δ_h = δ_{gh}`, unit `δ_e`,
  and rigidity with `δ_gᘁ = δ_{g⁻¹}` (structure maps built from `ω`), so `δ_gᘁᘁ = δ_g`. The pivotal
  classification below holds for any `G`; the fusion-level invariants (Frobenius–Perron and global
  dimension) need `G` finite.
  - Build a **degree-3 cocycle** predicate `IsThreeCocycle ω` and the normalization
    conditions from the general `groupCohomology`/`inhomogeneousCochains` differential (Mathlib's
    bespoke API stops at degree 2); cohomologous cocycles give monoidally equivalent categories.
- **Classification of pivotal structures on `Vec^ω_G`.** The double dual `(-)ᘁᘁ` is naturally
  isomorphic to the identity by a **canonical** scalar-valued iso determined by `ω`; a pivotal
  structure is that canonical one twisted by a **character**, so pivotal structures on `Vec^ω_G` form
  a **torsor over `Hom(G, kˣ)`** (in particular a pivotal structure always exists). Identify the
  **spherical** ones among them.
- **Frobenius–Schur indicators.** Define the Frobenius–Schur indicators (Ng–Schauenburg) from the
  pivotal structure and compute them on the `δ_g`, giving a concrete invariant that distinguishes the
  pivotal structures.

### Layer 5: gradings, the universal grading group, and the DGNO classification

- **Grading of a fusion category by a group.** A faithful grading `C = ⊕_{g∈G} C_g` with
  `C_g ⊗ C_h ⊆ C_{gh}` and `𝟙_C ∈ C_e`; the **adjoint subcategory** `C_ad` (the subcategory generated
  by `X ⊗ Xᘁ`), which is the trivial component of the universal grading.
- **The universal grading group** `U(C)`: the group carrying the finest faithful grading, through
  which every grading of `C` factors, with trivial component `C_ad` (Gelaki–Nikshych;
  Drinfeld–Gelaki–Nikshych–Ostrik, *On braided fusion categories I*, §2–3).
- **The classification theorem.** For a fusion category over an algebraically closed field of
  characteristic 0, `Aut_⊗(𝟭_C) ≅ Hom(U(C), kˣ)` — the monoidal natural automorphisms of the identity
  are exactly the characters of the universal grading group. Combined with Layer 1's torsor: **the
  set of pivotal structures is a torsor over `Hom(U(C), kˣ)`.**
- **Recovering the examples.** `U(Vec^ω_G) = G`, recovering Layer 4's `Hom(G, kˣ)` count; and the
  standard pivotal structure of Layer 3 as a distinguished point of the corresponding torsor.

### Layer 6: the synoptic chart of tensor categories (HPT Figure 2)

State the whole chart — the definitions of the remaining nodes and every arrow between them.

- **The nodes.** In addition to `MonoidalCategory` (tensor), `RigidCategory` (rigid), `Pivotal`,
  `Spherical` above:
  - **Braided** (`BraidedCategory`, consume) and its rigid, balanced, and pivotal combinations;
  - **Balanced** = braided with a **twist** `θ_X : X ≅ X` natural in `X` and satisfying
    `θ_{X⊗Y} = (β_{Y,X} ∘ β_{X,Y}) ∘ (θ_X ⊗ θ_Y)`;
  - **Ribbon** = balanced and rigid with `θ_{Xᘁ} = (θ_X)ᘁ`.
- **Forgetful and axiom-imposing arrows.** The plain forgetful maps (braided → tensor, rigid →
  tensor, balanced → braided, pivotal → rigid, spherical → pivotal as a full subclass by imposing
  `tr_L = tr_R`, ribbon → balanced+rigid), matching the two arrow types of Figure 2 (forget data /
  impose axioms).
- **The Drinfel'd-centre arrows.** `Z(-)` sends each row to its braided enrichment:
  `Z(tensor)` is braided, `Z(rigid)` is braided+rigid, `Z(pivotal)` is braided+pivotal, and
  `Z(spherical)` is **ribbon** (Müger). Consume `Center C` and `braidedCategoryCenter`; the key
  content is **HPT Proposition 2.3**, that a pivotal structure on `C` induces one on `Z(C)` (dual of
  `(a, eₐ)` is `(aᘁ, …)`, and `φ` lifts), and the sphericity/ribbon upgrade.
- **The central equivalence** `balanced+rigid ≃ braided+pivotal`. A braided rigid category is pivotal
  iff it is balanced, via the **explicit twist** built from the braiding and the pivotal structure
  (HPT eq (3)): `θ_X = (𝟙_X ⊗ ε_{Xᘁ}) ∘ (β_{Xᘁᘁ, X} ⊗ 𝟙_{Xᘁ}) ∘ (𝟙_{Xᘁᘁ} ⊗ η_X) ∘ φ_X`. There are
  two such equivalences (the two ways of going between the notions); fix the one given by eq (3) and
  state the round-trips. Ribbon corresponds to the spherical pivotal structures under it.

---

## Worked examples (acceptance criteria)

- **`FDRep G` is spherical** with `dim V = finrank k V` and `tr = ` ordinary trace (Layer 3).
- **`Vec^ω_G` pivotal structures ↔ `Hom(G, kˣ)`**, a torsor; a pivotal structure always exists; the
  spherical ones are identified (Layer 4).
- **Frobenius–Schur indicators** of the `δ_g` in `Vec^ω_G`, and of the irreducibles in `FDRep G`,
  computed from the pivotal structure (Layers 3–4).
- **The twist from a braided pivotal category** (eq (3)) recovers the balanced/ribbon structure, and
  on a symmetric example (`Rep k G` with the standard pivotal structure) gives the trivial twist
  `θ = 𝟙` (Layer 6).
- **`Z(spherical)` is ribbon** on a small pointed example (Layer 6).
- **`U(Vec^ω_G) = G`** and the induced torsor count matches Layer 4 (Layer 5).

## Ordering

Layer 0 (the double-dual functor) is the foundation; Layer 1 (pivotal) and Layer 2 (traces,
dimensions, spherical) are the core and come next. Layers 3 and 4 are the two examples that keep the
core honest and can proceed in parallel once Layers 1–2 land. Layer 5 (universal grading) generalizes
and unifies both examples and depends on the fusion-category API being in place. Layer 6 (the synoptic
chart) depends on the braided/balanced/ribbon definitions and the Drinfel'd centre, and on Layers 1–2
for the pivotal/spherical nodes; the central equivalence and the centre arrows are its most technical
part.

## References

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
  indicators computed in Layers 3–4.
- M. Müger, *From subfactors to categories and topology II*, J. Pure Appl. Algebra 180 (2003) — the
  centre of a spherical category is ribbon/modular.
- P. Etingof, S. Gelaki, D. Nikshych, V. Ostrik, *Tensor Categories*, AMS (2015) — the textbook
  reference for all of the above (Ch. 4 duals and pivotal/spherical, Ch. 3 gradings, Ch. 7
  Frobenius–Perron and global dimension).

## Acknowledgements

This roadmap organizes its synoptic chart around Figure 2 of Henriques–Penneys–Tener
(arXiv:1509.02937), whose §2 background on the flavours of tensor category, the exact trace formulas,
and the two equivalences between balanced-rigid and braided-pivotal categories it follows closely.

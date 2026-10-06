# Roadmap: Hodge structures (pure, mixed, and polarized)

The narrative roadmap for **Hodge theory's linear-algebraic core** — pure, mixed, and polarized
Hodge structures and their period-domain points — at general weight, as a reusable library;
`Suggested.lean` states the milestones as `sorry`-goals. Its summit in the pure theory is the
**semisimplicity of polarizable Hodge structures** (Hodge–Riemann), and in the mixed theory Deligne's
**strictness**. Written to the roadmap conventions: build the library not one theorem, ground in
Mathlib's vocabulary, pin conventions up front, and — because this is a subject Mathlib has *nothing*
on — get the **definitions** right (the `JacobianChallenge` philosophy: the definitions are the
deliverable).

**Mathlib has no Hodge structures at all** — no pure or mixed Hodge structures, no polarizations, no
Hodge–Riemann relations, no period domains. It has exactly the linear-algebra *prerequisites*, and
this roadmap is built on them (named in *Prior art*). The goal is that a researcher in Hodge theory,
periods, modular forms, motives, or mathematical physics finds pure and mixed Hodge structures,
polarizations, and period-domain points at their natural generality with full basic API — so that the
structural theorems (semisimplicity, strictness) are *consequences of a developed library*, not
isolated endpoints.

**This entry is the structural theory of Hodge structures only** — linear algebra over filtrations,
with no analysis or geometry. Two things sit outside it; each is named as a real target *elsewhere*,
not as non-milestone prose here:

- The **variations** of Hodge structure — period domains as complex manifolds, the VHS datum
  (holomorphic Hodge-filtration bundle + Griffiths transversality `∇F^p ⊆ F^{p−1}⊗Ω¹`), period maps,
  and monodromy/rigidity — are the **successor roadmap** *Variations of Hodge structure* (see
  *Successor roadmap* below), which uses Mathlib's complex-manifold / connection API. They build
  directly on the fiber datum, period-domain points, and symmetry group defined here.
- The **geometric/analytic engines** that *produce* Hodge structures — the Kähler Hodge decomposition
  (`Hⁿ = ⊕ H^{p,q}`), Gauss–Manin, and Schmid's asymptotics — supply *instances* from elsewhere (the
  weight-1 / abelian-variety case — curves and their Jacobians — is the worked model; see *Relation to
  sibling roadmaps*).

Suggested home: `TauCeti/Geometry/Hodge/` (`…/Hodge/Structure.lean`, `…/Polarization.lean`,
`…/Mixed.lean`, `…/PeriodDomain.lean`).

## Prior art

- **Mathlib — the prerequisites this entry consumes (nothing on Hodge theory itself).**
  - Tensor/base change: the complexification is stated via **`IsBaseChange`** (root namespace, in
    `Mathlib/RingTheory/IsTensorProduct.lean`; the `ℤ→ℚ→ℂ` tower composes by `IsBaseChange.comp`),
    with the **canonical instance** the concrete
    tensor `TensorProduct ℤ ℂ V` / `TensorProduct ℤ ℚ V` (base-change witness `TensorProduct.isBaseChange`;
    on that instance the tower iso is `…cancelBaseChange : ℂ ⊗_ℚ (ℚ ⊗_ℤ V) ≃ ℂ ⊗_ℤ V`). Supporting
    tensor API: `TensorProduct.map`, `TensorProduct.AlgebraTensorModule.congr`, `LinearMap.baseChange`,
    `Submodule.baseChange`, `Basis.baseChange`.
  - Bilinear forms: `LinearMap.BilinForm`, `BilinForm.baseChange` (extension of scalars of a form,
    with `baseChange_tmul`), `BilinForm.Nondegenerate`, `.IsOrtho`, `.IsSymm`/`.IsAlt`, `.restrict`.
  - Filtrations/decompositions: `Submodule`, `IsCompl`, `DirectSum.IsInternal`, `Module.finrank`,
    `Module.Free`/`Module.Finite` (the lattice), `Antitone`/`Monotone`.
  - Conjugation: `starRingEnd ℂ` (complex conjugation as the semilinearity ring hom); there is **no**
    packaged real/integral complexification-with-conjugation, so `latticeConj` is built here.
  - **Filtration / complex-structure API, aligned with Deligne §1.2.1.** L0's opposed filtration
    (`IsCompl (F^p) (conj F^{n+1−p})`) and L2's `gradedF` / `gradedComplexEquiv` follow Deligne,
    *Théorie de Hodge II* §1.2.1 (opposed filtrations §1.2.1–1.2.3; induced filtrations on graded pieces
    §1.2.1). Mathlib carries no abelian-category filtration API of this kind, so nothing here depends
    on one: this roadmap is concrete over `Submodule ℂ V_ℂ`, and L0/L2 name their filtration API to
    align with Deligne §1.2.1 directly. Work towards such an API is under way in Mathlib, out of Joël
    Riou's `n`-opposed-filtrations work on the `#mathlib4` *Complexifications with a view towards Hodge
    theory* thread; should it land, L0's `opposed` and L2's `gradedF` / `gradedComplexEquiv` are the
    places to specialize onto it.
    - *Complex structures on real vector spaces* — the `J`, `J² = −1` route to the
      `(p,q)`-decomposition (the `±i`-eigenspace picture); cf.
      [mathlib4#40975](https://github.com/leanprover-community/mathlib4/pull/40975). **Prior art only,
      not a prerequisite this entry consumes:** it is unmerged, and this roadmap does not depend on
      unmerged Mathlib work. The Deligne opposed-filtration route taken here (L0 `piece`, per Riou's
      recommendation) and the `J`-eigenspace route agree **only under a hypothesis**: a `J` has just
      the two eigenvalues `±i`, so it recovers the decomposition exactly when the structure has two
      conjugate types with `p−q` odd — effective weight one and its Tate twists. Outside that the
      `±i` eigenspaces group types by `p−q` mod 4. (Relatedly, the Weil operator is a complex
      structure only in odd weight, since `C² = (−1)^n`.) The L0 *instance bridge* note records how
      effective weight-1 / abelian-variety instances carrying a `J` plug in.
  - *(For the successor `Variations of Hodge structure` roadmap, not consumed here:*
    `CategoryTheory.FundamentalGroupoid` and `ModuleCat ℤ` for local systems, Mathlib's
    complex-manifold / connection API for Griffiths transversality, and — for monodromy rigidity —
    the Schur lemma **Mathlib already provides**, `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`
    (over the algebraically closed `ℂ`, every endomorphism of a simple module is scalar), reached via
    `Representation.irreducible_iff_isSimpleModule_asModule`.)*
- **Other proof assistants.** Hodge structures, polarizations, and variations of Hodge structure are
  largely unformalized (Isabelle/HOL, Coq/Rocq); adjacent pieces exist (abelian varieties, the upper
  half-space). In Lean 4, work by Booker Smith
  ([pure-hodge-structures-lean4](https://github.com/thebookersmith/pure-hodge-structures-lean4),
  [announcement](https://leanprover.zulipchat.com/#narrow/channel/583339-AI-authored-projects/topic/Pure.20Hodge.20structures.20in.20Lean.204))
  formalizes exactly the **L0** layer — the `(p,q)`-decomposition ↔ opposed-filtration equivalence,
  both directions, axiom-clean — taking the `ℚ`-space as primary where this roadmap takes the
  `ℤ`-lattice; it is a useful cross-check for the L0 signature. The polarization / mixed /
  period-domain superstructure (L1–L3) remains new foundational material, not a port.
- **The weight-1 instance is concrete and reachable.** Effective weight-1 Hodge structures (type
  `{(1,0),(0,1)}`) are complex tori `ℂ^g/Λ`, and the *polarizable* ones are abelian varieties; their
  period domain is the **Siegel upper half space**. The intrinsic integral symmetry group is
  `Aut(V, Qint)`; it is `Sp(2g, ℤ)` only when the elementary divisors of `Qint` agree, i.e. when the
  form is a scalar multiple of the standard symplectic one — a general nondegenerate integral
  alternating form gives a paramodular group. The
  effectivity hypothesis is essential: a *general* weight-1 Hodge structure may carry `H^{2,−1}`,
  `H^{−1,2}`, … (the Weil operator's `±i`-eigenspaces then aggregate *all* odd-`(p−q)` classes, not
  just `H^{1,0}`/`H^{0,1}`), so the abelian-variety / Siegel / `J`-eigenspace identifications hold only
  under `HodgeStructure.IsEffective` (Hodge numbers supported in `[0,n]`). That effective case (periods
  of curves, Jacobians) is the natural worked realization of the framework's weight-1 interface.
  *(Torsion caveat: for a geometric instance the lattice `V_ℤ` is `Hⁿ(X;ℤ)/torsion`, or the rational
  structure taken as primary with a chosen lattice — `Module.Free ℤ V` rules out the torsion that
  integral cohomology can carry.)*

## Core definitions (the chief deliverable)

*This section states the intended design. `Suggested.lean` is a non-exhaustive snapshot of it: where
a name below does not yet appear there, that is an absence and a target, not a claim about the file.*

Getting these right is the point of the entry; each is stated in `Suggested.lean` and elaborates against
the pinned Mathlib.

- **The integral lattice is primary datum.** A weight-`n` Hodge structure is carried on a finitely
  generated free `ℤ`-module `V = V_ℤ` (`[Module.Free ℤ V] [Module.Finite ℤ V]`). A Hodge structure is
  **not** modeled as a bare complex vector space with a free-floating involution — that loses the
  arithmetic and makes semisimplicity / monodromy unstatable at their real strength.
- **The complexification is specified by a base-change interface, not a fixed construction.** The
  complex space is an ambient `ℂ`-vector space `V_ℂ` with a `ℤ`-linear structure map
  `ι_ℂ : V →ₗ[ℤ] V_ℂ` exhibiting it as the base change — `IsBaseChange ℂ ι_ℂ` — and likewise `V_ℚ`
  via `IsBaseChange ℚ ι_ℚ`. The **canonical instance** is the concrete tensor `V_ℂ := ℂ ⊗[ℤ] V`
  (`Complexification V`), `V_ℚ := ℚ ⊗[ℤ] V` (`Rationalification V`) with `ι = (1 ⊗ ·)`, whose
  base-change witness is `TensorProduct.isBaseChange`; every definition and milestone is **stated
  against the interface and checked on this instance.** This is the convention Johan Commelin, Andrew
  Yang and Kevin Buzzard converged on for Hodge theory (`#mathlib4`, *Complexifications with a view
  towards Hodge theory*), adopted here because it buys two things the concrete tensor does not: (i)
  **geometric instances plug in with no transport iso** — a `V_ℂ` arising as `Hⁿ(X;ℂ)` (not literally
  `ℂ ⊗ Hⁿ(X;ℤ)`) satisfies the predicate directly, decisive for the successor's variations whose fibers
  are cohomology; and (ii) the nested-tower pain below is dissolved by transitivity of base change
  (`IsBaseChange.comp`). The integral lattice `V_ℤ` stays the primary datum — `IsBaseChange` is a
  predicate *about* the structure map out of it.

  *Interface and instance are different levels, and both appear.* `IsBaseChange S f` is a **`Prop`**:
  it says an `S`-module `N` with `f : M →ₗ[R] N` behaves as the base change (Mathlib:
  "the map `S × M → N, (s, m) ↦ s • f m` is the tensor product"), so `N` need not *be* `S ⊗[R] M` —
  which is what (i) buys. `AlgebraTensorModule.cancelBaseChange` is by contrast **data**, a specific
  equivalence `M ⊗[A] (A ⊗[R] N) ≃ₗ[B] M ⊗[R] N` between literal tensor products. They sit at
  different levels rather than competing: the tower composes *as a property* by `IsBaseChange.comp`,
  and the canonical tensor instance **discharges** that property — `cancelBaseChange` is what it uses
  to do so. The practical difference is `Prop` versus data: a proof is passed around and consumed
  through `IsBaseChange.lift`, whereas an equivalence has to be threaded through every construction
  as `.map …toLinearMap`. Abstract statements should take the former route; the concrete
  rational-to-complex path currently takes the latter, and that is the ergonomic cost the interface
  exists to remove.
- **One pure-Hodge object, parametric in the conjugation — the integral and rational cases are not
  two definitions.** The weight-`n` axioms (bounded, antitone, `n`-opposed) mention the ambient
  `ℂ`-space and a conjugation on it, and nothing else: of `HodgeStructure`'s five fields, four
  mention only `F`, and `opposed` mentions `latticeConj hℂ`, whose type is just
  `V_ℂ →ₛₗ[starRingEnd ℂ] V_ℂ`. The lattice `V_ℤ`, `ι_ℂ`, `hℂ` and the freeness/finiteness
  hypotheses are in scope but appear in no field. So state the object once, over a `ℂ`-space with a
  conjugation. **This is a target, not a description of `Suggested.lean`**, which still carries the
  lattice-indexed `HodgeStructure`:
  ```lean
  /-- A conjugation on a ℂ-space: a conjugate-linear involution. -/
  structure Conjugation (W : Type*) [AddCommGroup W] [Module ℂ W] where
    toEquiv    : W ≃ₛₗ[starRingEnd ℂ] W
    involutive : Function.Involutive toEquiv

  structure HodgeStructureOn (W : Type*) [AddCommGroup W] [Module ℂ W]
      (ω : Conjugation W) (n : ℤ) where
    F : ℤ → Submodule ℂ W
    F_antitone : Antitone F
    F_top : ∃ p, F p = ⊤
    F_bot : ∃ p, F p = ⊥
    opposed : ∀ p, IsCompl (F p) ((F (n + 1 - p)).map ω.toEquiv.toLinearMap)
  ```
  **Involutivity is part of the datum**, not a lemma alongside it: `n`-opposedness is only meaningful
  for an involution, and today `latticeConj_involutive` sits outside the structure. `latticeConj` +
  `latticeConj_involutive` package into one `Conjugation V_ℂ`, and `gradedConj` +
  `gradedConj_involutive` into another. The integral object would then be an **abbreviation, not a
  copy** —
  `HodgeStructure hℂ n := HodgeStructureOn V_ℂ (latticeConjugation hℂ) n` — so every existing
  reference survives and the axioms exist in exactly one place. `IsEffective` and `piece` are stated
  in terms of `F` alone and move across unchanged; `Polarization` does **not**, and stays on the
  lattice, since its form `Qint` is integral.
  *Note on the section variables:* `V_ℂ` is a section variable today, so the general object takes the
  ambient space as a parameter and lives outside that context (or `omit`s it, as 29 declarations in
  the file already do for `Module.Free`/`Module.Finite`).
- **Conjugation is defined, not assumed.** `latticeConj : V_ℂ →ₛₗ[starRingEnd ℂ] V_ℂ` is the
  conjugate-linear map fixing the integral points, `latticeConj (ι_ℂ v) = ι_ℂ v` — determined by the
  base-change universal property, and unique as such (*companion to prove*: an instance author will
  want that uniqueness lemma, and L2's abstract conjugation-equivariance is proved from it). On the canonical tensor instance it is
  `TensorProduct.map (starRingEnd ℂ) id` (`z ⊗ v ↦ z̄ ⊗ v`), with `map_smul` and
  `latticeConj_involutive` **proved**. The `n`-opposedness `IsCompl (F^p) (conj F^{n+1-p})` and the
  `(p,q)`-piece `F^p ⊓ conj(F^{n-p})` use this canonical map.
- **Polarization is one integral form, with the Hodge–Riemann relations as a `Prop` mixin.** The
  conditions that a *given* integral form polarizes a structure — `(-1)^n`-symmetry, nondegeneracy,
  orthogonality `Q(F^p, F^{n−p+1}) = 0`, and positivity `i^{p−q} Q(v, v̄) > 0` on `H^{p,q}` — are
  packaged as a genuine `Prop`, `IsPolarization hs Qint`. `Polarization hs` is then just a
  form together with a proof that it polarizes (a two-field structure, equivalently the subtype
  `{ Qint : LinearMap.BilinForm ℤ V // IsPolarization hs Qint }`),
  and its complex form is **derived**, `Q := Qint.baseChange ℂ`, so the integral↔complex link is
  Mathlib's `baseChange_tmul`, not a hand-imposed axiom. Splitting the predicate out lets a **fixed**
  form be required to polarize a structure without carrying the form twice — used by
  `PeriodDomain.Point`.
- **Rational substructures derive their complexification.** A `RationalHodgeSubstructure` carries only
  its `ℚ`-subspace `WQ`; the complex side `WC := rationalToComplexSubmodule WQ` is its base change along
  the `ℚ→ℂ` structure map — so there is no bare-`Prop` "is the complexification" placeholder. Likewise
  the mixed weight filtration.
  *Implementation note:* under the base-change interface the two-step `ℤ→ℚ→ℂ` tower composes by
  `IsBaseChange.comp`, removing most of the ergonomic weight the concrete nested tensor
  `ℂ ⊗_ℚ (ℚ ⊗_ℤ V)` carried. **Target:** the composed witness itself,
  `IsBaseChange ℂ (ι_{ℚℂ} ∘ₗ ι_ℚ)` from the two legs — without it the abstract tower is asserted but
  not available, and constructions fall back on transporting along `cancelBaseChange` by hand. The
  implementation should still
  carry a `@[simp]` suite for moving elements through `rationalToComplexSubmodule` and `Polarization.Q`
  (the `Q_tmul` pure-tensor lemma is the first of these) to keep the L1/L2 proofs tractable.

## Worked instances

The definitions above are the chief deliverable, so at least one explicit nonzero inhabitant is
blocking: without one, nothing rules out a definition that no object satisfies. The canonical
tensor instance exercises the base-change plumbing, not the Hodge conditions.

- **Blocking — the Tate structure `ℤ(m)`.** Rank one: `V_ℤ = ℤ` (classically `(2πi)^m ℤ ⊂ ℂ`), pure
  of **weight `−2m`**, of type `(−m, −m)`, so `F^p = V_ℂ` for `p ≤ −m` and `⊥` above. Opposedness is
  degenerate but worth checking once: `IsCompl ⊤ (conj ⊥)` for `p ≤ −m`, and `IsCompl ⊥ (conj ⊤)`
  above.
  *Targets:* `tate (m : ℤ)` with `weight (tate m) = −2m`; `piece (tate m) p = if p = −m then ⊤ else ⊥`
  and the Hodge numbers (`h^{−m,−m} = 1`, else `0`); `IsPolarization (tate m) Q` for the rank-one
  integral form `Q u v = u * v` (weight `−2m` is even so `(−1)^n`-symmetry is symmetry, and
  positivity reads `Q(v, v̄) > 0` since `p = q = −m`); and the **Tate twist** `V(m) := V ⊗ tate m`
  with `weight (V(m)) = weight V − 2m`, `F^p (V(m)) = F^{p+m} V`, which is what pins the weights and
  filtration shifts of the L0 companion line.
- **Effective weight one** (recommended). A lattice `Λ ≅ ℤ^{2g}` with a complex structure `J` on
  `Λ_ℝ` and its Riemann form `E`: a polarized effective weight-1 structure. This is the
  abelian-variety case the generality bar names, and the one instance exercising `IsEffective`, the
  `J`-eigenspace bridge and `IsPolarization` together.
- **A pure structure viewed as mixed** (recommended). `W` concentrated in a single degree, so
  `gr^W_n = V`. Cheap, and it shows `graded_pure` is satisfiable — connecting L0 to L2 rather than
  leaving them independent.

## Generality bar (decide up front; do not silently specialize)

- **Weight-general, polarized, integral.** State pure Hodge structures for arbitrary weight `n : ℤ` on
  the integral lattice; `ℚ`/`ℝ` variants are base changes. Do **not** hardcode weight 1 — weight 1 is
  the *example*, not the definition. Semisimplicity is stated over `ℚ`.
- **Effectivity is a named hypothesis, never a silent default.** The weight-general definition admits
  non-effective structures (`H^{p,q}` with `p < 0` or `p > n`). The abelian-variety / Siegel /
  `J`-eigenspace facts are stated under `HodgeStructure.IsEffective` (Hodge numbers in `[0,n]`).
- **The symmetry group is exposed.** `IsLatticeIsometry Qint` cuts out `Aut(V_ℤ, Qint)` (integral
  automorphisms preserving the form) — the target of a variation's monodromy, provided here so the
  successor roadmap consumes it rather than redefining it.
- **Period-domain points at general type.** A *point* of the classifying space `D` of polarized Hodge
  structures of a fixed Hodge type is a filtration of that type on the fixed `(V, Qint)`; build it at
  general type, not just weight 1. (The **manifold** structure on `D` is the successor roadmap — see
  *Successor roadmap*.)

## Conventions (pinned)

- **Complexification model: base-change interface, tensor as canonical instance.** The complex and
  rational spaces are specified by `IsBaseChange` predicates on structure maps out of `V_ℤ`, with the
  concrete tensors `ℂ ⊗[ℤ] V` / `ℚ ⊗[ℤ] V` as the canonical instance. Definitions are stated against
  the interface and checked on the tensor — chosen so geometric instances (cohomology) satisfy the
  interface without a transport iso, and the `ℤ→ℚ→ℂ` tower composes (`IsBaseChange.comp`).
- **Hodge filtration as the primary analytic datum.** A weight-`n` HS on `V` is a decreasing filtration
  `F^•` on `V_ℂ` that is **`n`-opposed**: `F^p ⊕ \overline{F^{n+1−p}} = V_ℂ` for all `p` (equivalently
  the `(p,q)`-decomposition with `V^{q,p} = \overline{V^{p,q}}`). Bounded: `F^p = ⊤` for `p ≪ 0`, `⊥`
  for `p ≫ 0` (needed to rule out degenerate filtrations with vanishing pieces).
- **Polarization:** a `(−1)^n`-symmetric integral form `Q` with the **Hodge–Riemann relations**
  (`Q(F^p, F^{n−p+1}) = 0`; `i^{p−q} Q(v, v̄) > 0` on `V^{p,q}`), packaged as the `IsPolarization` `Prop`.
  **Sign convention (pinned):** we use `Q(y,x) = (−1)^n Q(x,y)` with `i^{p−q} Q(v, v̄) > 0`. This is
  internally consistent, but a **geometric** cup-product polarization normally carries an extra
  `(−1)^{n(n−1)/2}` together with a Lefschetz-power and primitivity convention; an instance realized
  from cup product must insert that factor to match. Pinned here so instance authors do not pick the
  wrong sign.
- **Mixed:** an increasing weight filtration `W_•` (over `ℚ`) + decreasing `F^•` inducing a pure
  weight-`k` HS on each `gr^W_k`.
- **Symmetry group:** `G = Aut(V, Q)`, cut out by `IsLatticeIsometry Q` (integral automorphisms
  preserving the form). This is where a variation's monodromy `ρ : π₁(B) → G(ℤ)` lands — defined in the
  successor roadmap, on top of this group.

## Layers (each a discharge-gated milestone; the `sorry` goal in `Suggested.lean` is the target)

- **L0 — Pure Hodge structures; the Hodge decomposition.**
  *Definitions:* `HodgeStructure V n` (the `n`-opposed bounded filtration), `piece p = F^p ⊓ conj(F^{n−p})`.
  *Milestone:* `DirectSum.IsInternal hs.piece` — the `(p,q)`-pieces are an internal direct sum
  `V_ℂ = ⨁_p H^{p,q}`.
  *Discharge:* the standard equivalence "`n`-opposed filtration ⟺ `(p,q)`-decomposition." From
  `opposed` (`IsCompl (F^p) (conj F^{n+1−p})`) plus boundedness, prove by descending induction on `p`
  that `F^p = ⨆_{p'≥p} H^{p',·}` and that the pieces are independent (`H^{p,q} ⊓ ⨆_{p'>p} H^{p',·} = ⊥`
  from opposedness); assemble via `DirectSum.isInternal_submodule_iff_iSupIndep_and_iSup_eq_top`,
  `iSupIndep`, `IsCompl`. Voisin I, §6 (the opposedness lemma). Name `opposed` to align with Deligne
  §1.2.1; if the in-progress Mathlib filtration API (mathlib4#42642) lands, this is the place to
  specialize onto it (see *Prior art*).
  *Companions to build:* morphisms of HS, the `(p,q)` symmetry
  `conj (piece p) = piece (n−p)`, `⊗`/`Hom`/dual, and the `ℤ`-Tate twist with its shifts pinned:
  `V(m) := V ⊗ tate m` has `weight (V(m)) = weight V − 2m` and `F^p (V(m)) = F^{p+m} V`
  (see *Worked instances*).
  *Effectivity:* `HodgeStructure.IsEffective` (Hodge numbers in `[0,n]`, i.e. `F^0 = ⊤`, `F^{n+1} = ⊥`)
  is the named hypothesis under which the classical weight-1 identifications hold — see the instance
  bridge and *Prior art*.
  *Instance bridge (weight 1, effective):* an **effective** weight-1 HS carries a complex structure `J`
  (`J² = −1`) on the real form `V_ℝ`, whose `±i`-eigenspaces are exactly the `(1,0)`/`(0,1)` pieces, so
  `piece` agrees with the `J`-eigenspace decomposition. *(Without effectivity a
  weight-1 HS may have `H^{2,−1}`, `H^{−1,2}`, … and the `±i`-eigenspaces mix odd-`(p−q)` classes, so
  the agreement fails.)* The roadmap consumes the Deligne opposed-filtration route
  (`piece = F^p ⊓ conj(F^{n−p})`, per Riou). *Companions to build:* `V_ℝ` with its structure map, the
  construction of `J` from an effective weight-1 structure, and the eigenspace comparison, so that
  effective weight-1 examples can be produced either way and the two agree. Cf.
  [mathlib4#40975](https://github.com/leanprover-community/mathlib4/pull/40975) as prior art, not as a
  dependency (see *Prior art*).
- **L1 — Polarization & Hodge–Riemann; semisimplicity (summit of the pure theory).**
  *Definitions:* `IsPolarization hs Qint` (the HR relations as a `Prop` on a given form),
  `Polarization hs` (integral `Qint` + an `IsPolarization` proof; derived `Q`),
  `IsPolarizable hs := ∃ Qint, IsPolarization hs Qint`, `RationalHodgeSubstructure`.
  *Milestone:* every rational Hodge substructure `W` has an orthogonal rational Hodge-substructure
  complement (`IsCompl` on both `WQ` and `WC`, `Q`-orthogonal) — hence **the category of
  *polarizable* `ℚ`-HS, with ordinary Hodge morphisms, is semisimple.**
  *Which category.* `IsPolarizable` (a property) rather than `Polarization` (a chosen form), and
  ordinary morphisms rather than isometries. With a fixed polarization and polarization-preserving
  maps the category is not even additive — neither the zero map nor a sum of isometries is an
  isometry — so semisimplicity would not be the usual statement about it. The polarizable category
  is the one Voisin I §7.1.2 and Peters–Steenbrink §2 state the theorem for, and it is what the
  milestone above actually proves: the complement is produced from *some* polarizing form, and
  nothing downstream needs the form to be part of the object.
  *Weil operator:* `i^{p−q} Q(u, v̄)` is not defined until `u` is homogeneous, so the passage from a
  form on each piece to a form on `V_ℂ` needs a carrier. That carrier is the **Weil operator** `C`,
  acting by `i^{p−q}` on `H^{p,q}` and extended off the L0 decomposition, with
  `h(u,v) := Q(C u, v̄)` defined on all of `V_ℂ`. Target it in its own right: its definition from
  `piece`, its action on pieces, `C² = (−1)^n` (so `C` is a complex structure exactly in odd
  weight), compatibility with `latticeConj` and with `Q`, and positive-definiteness of `h`.
  Everything downstream wanting a Hermitian form wants `C`.
  *Discharge:* the Hodge–Riemann positivity makes `h` positive definite on each piece, and `C`
  extends it to a definite Hermitian form on `V_ℂ` for which `conj`/`Q` are compatible; the `Q`-orthogonal complement of a sub-HS is again a sub-HS, and (since `Q` is rational
  and nondegenerate) it is defined over `ℚ`. `V = W ⊕ W^⊥`. Consume the `BilinForm.Nondegenerate`
  orthogonal-complement API and the L0 decomposition. Voisin I, §7.1.2; Peters–Steenbrink §2.
- **L2 — Mixed Hodge structures; strictness (Deligne).**
  *Definitions:* `MixedHodgeStructure V` — a bounded monotone `ℚ`-weight filtration `WQ`
  (`WQ_top`/`WQ_bot`) and a bounded antitone Hodge filtration `F` (`F_top`/`F_bot`, mirroring
  `HodgeStructure`), plus `graded_pure`. The complex weight `WC_k := rationalToComplexSubmodule (WQ_k)`
  is derived, with monotonicity and conjugation-stability as proved lemmas
  (`rationalToComplexSubmodule_mono`/`…_conj`). `graded_pure` is stated **rationally**: the rational
  graded `grᵂ_k = W_{ℚ,k}/W_{ℚ,k−1}` (`weightGradedRat`) carries an induced conjugation `gradedConj`
  (a proved conjugate-linear involution) and induced filtration `gradedF`, and `graded_pure` requires
  `gradedF` to be bounded, antitone, and `k`-opposed w.r.t. `gradedConj`. With the conjugation-parametric
  object above this **becomes** the pure-Hodge predicate rather than a restatement of it:
  `graded_pure k := Nonempty (HodgeStructureOn (ratComplexify (gr^W_k)) (gradedConjugation WQ k) k)`
  — "`gr^W_k` carries a Hodge structure of weight `k`", literally, and the rational pure object L1's
  category needs. `gradedConj` already has the required type and `gradedConj_involutive` is proved,
  so it packages directly as a `Conjugation`.
  A proved iso `gradedComplexEquiv : WC_k/WC_{k−1} ≃ ℂ ⊗_ℚ grᵂ_k` (complexification commutes with the
  quotient) identifies the two, so an MHS induces a pure *rational* HS on each graded.
  *Milestone:* a morphism of MHS — a single rational map `fQ`, complex action the derived
  `fC := rationalMapToComplex fQ` (`WC`-compatibility proved; conjugation-equivariance is a target,
  see *Conjugation-equivariance* below)
  — is **strict** for both filtrations: `range fQ ⊓ W'_{ℚ,k} = fQ(W_{ℚ,k})` (and its complexification)
  and `range fC ⊓ F'^p = fC(F^p)`.
  *Discharge:* Deligne's canonical `(p,q)`-bigrading (the Deligne splitting), which every MHS morphism
  respects. The bigrading is **defined**, not merely shown to exist: `deligneSplitting`
  (`I^{p,q}`) is given by Deligne's closed formula in `F`, `conj F` and `W`, with
  `DirectSum.IsInternal` and its characterizing API — recovery of `F` (`F^p = ⨆_{p'≥p} I^{p',q}`),
  recovery of `W` (`(W_k)_ℂ = ⨆_{p+q≤k} I^{p,q}`), the conjugation relation
  `I^{p,q} ≡ conj (I^{q,p})` **modulo** `⨆_{r<p, s<q} I^{r,s}` — in the standard convention the error
  term sits below the bidegree of the left-hand side, so writing it with the conjugation on the other
  side swaps the bounds to `conj (I^{p,q}) ≡ I^{q,p} mod ⨆_{r<q, s<p} I^{r,s}` (Peters–Steenbrink
  §3.1). In the mixed case conjugation symmetry holds only up to strictly lower bidegree, unlike
  L0's pure `piece` — the characteristic subtlety of the theory. Finally functoriality (a morphism
  carries `I^{p,q}` into `I^{p,q}`).
  Propositional existence would close the milestone and leave the object unusable: a consumer could
  obtain the bigrading only by destructing an existential, would get a different witness each time,
  and could state no lemma about it. It is the working tool of the mixed theory — strictness itself
  is proved through it, and the variations successor consumes it.
  A `@[simp]` suite for `gradedConj`/`gradedF` keeps the quotient manipulations tractable. Deligne,
  *Théorie de Hodge II* 1.2.10 & 2.3.5; Peters–Steenbrink Ch. 3. Name `gradedF`/`gradedComplexEquiv` to
  align with Deligne §1.2.1; as for L0, specialize onto the in-progress Mathlib filtration API
  (mathlib4#42642) if it lands (see *Prior art*).
  *Conjugation-equivariance of the abstract `fC`.* Proved so far only for the canonical instance
  (`concreteRationalMapToComplex_conj`, by induction on tensors), which does not transfer to an
  abstract `V_ℂ`. **Target the abstract statement** `fC ∘ₗ latticeConj = latticeConj ∘ₗ fC`. It
  should follow from the **uniqueness of `latticeConj`** (the L0 companion above): both composites
  are conjugate-linear maps agreeing on the image of `ι_ℂ`, so the base-change universal property
  identifies them. This is the step that makes the interface usable by a geometric instance — an
  induction-on-pure-tensors argument is available only for the concrete model, so without the
  abstract proof every non-tensor instance would have to supply its own.

  *Morphisms:* the milestone is bundling-agnostic (unbundled `fQ`); the implementation bundles it into
  an `MHS.Hom` / category, whose **abelian-category** structure is exactly what strictness provides
  (kernels/cokernels of MHS morphisms are again MHS).
- **L3 — Period-domain points; the symmetry group.**
  *Definitions:* `HodgeType` (a weight, fixed Hodge numbers `h : ℤ → ℕ` of finite support, and the
  **Hodge symmetry** `h p = h (weight − p)`), `PeriodDomain.Point V n Qint htype` (a Hodge filtration
  of the prescribed type making the **fixed** form `Qint` a polarization — the form does not vary with
  the point; it enters as the `IsPolarization` witness, not as duplicated data), and `IsLatticeIsometry
  Qint` cutting out the symmetry group `Aut(V, Qint)`.
  *Milestone (seeded):* the Hodge numbers partition the dimension, `∑ᶠ p, h p = dim_ℂ V_ℂ` — the
  numerical shadow of L0, a genuine constraint on `HodgeType`.
  *Discharge:* from L0 (`DirectSum.IsInternal`) plus `hodge_numbers` (`finrank (piece p) = h p`), the
  total dimension is the finsum of piece dimensions — additivity of `Module.finrank` over the internal
  direct sum (via `DirectSum.IsInternal` + `Module.finrank`/`Basis`); `Basis.baseChange` gives
  `dim_ℂ V_ℂ = rank_ℤ V`.
  *Companions to build:* the `Subgroup`/`Group` packaging of `Aut(V, Qint)` from `IsLatticeIsometry`
  (the successor's monodromy target). The period domain's **manifold** structure is the successor
  roadmap, not this milestone.

## Successor roadmap: Variations of Hodge structure

*This section is a roadmap-for-a-roadmap: it sketches ambition beyond this entry, and contributors
should not work from it now — take targets from L0–L3 above.*

The **variations** theory is a separate roadmap,
[*Variations of Hodge structure*](https://github.com/TauCetiProject/TauCetiRoadmap/issues/167), that
**builds on the objects defined above** — exactly as `JacobianChallenge` builds on its own
prerequisites — using Mathlib's complex-manifold / connection API and flag-variety topology for the
analytic parts that lie outside this roadmap's linear-algebraic scope. Its milestones:

- **Period domains as complex manifolds** — `D` open in the flag variety of filtrations of a fixed
  `HodgeType`, the `Aut(V,Qint)_ℝ`-action, and the weight-1 (effective) ⇒ Siegel `Sp(2g,ℝ)/U(g)`
  identification. *Consumes:* `PeriodDomain.Point`, `IsLatticeIsometry`/`Aut(V,Qint)` from L3.
- **The VHS datum** — a local system (`CategoryTheory.FundamentalGroupoid B ⥤ ModuleCat ℤ`) + a
  holomorphic Hodge-filtration bundle + **Griffiths transversality** (`∇F^p ⊆ F^{p−1}⊗Ω¹`) + the period
  map `B̃ → D` (holomorphic, horizontal). *Consumes:* the L0–L1 fiber datum (each fiber a polarized HS).
- **Monodromy and rigidity** — the monodromy `ρ : π₁(B) → Aut(V,Qint)(ℤ)`; period-map rigidity;
  Deligne's **theorem of the fixed part** and **semisimplicity of monodromy**. The linear-algebraic
  engine is **Schur's lemma, which Mathlib already provides**
  (`IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` via
  `Representation.irreducible_iff_isSimpleModule_asModule`) — consumed, not re-proved.

A second, *purely algebraic* sibling produces this roadmap's objects rather than consuming period
domains: the bridge from **bicomplexes to a Hodge decomposition** (an abstract ∂∂̄-lemma and
E₁-degeneration of the Frölicher spectral sequence, making L0's `opposed` condition the output of a
cohomological theorem). It is statable on current Mathlib (bicomplexes + spectral sequences) — see
[TauCetiRoadmap#173](https://github.com/TauCetiProject/TauCetiRoadmap/issues/173).

## Relation to sibling roadmaps

- **`JacobianChallenge` (AG Jacobian).** Complementary, not overlapping: that entry builds
  `Jac = Pic⁰` as a *scheme* via the Abel–Jacobi universal property; this entry is the *transcendental*
  Hodge theory. They meet at one bridge — over `ℂ`, `Jac(X)(ℂ) ≅ ℂ^g/period-lattice` (the weight-1
  instance) — a natural joint target, not a duplication.
- **`ModularForms` (PR #47).** Modular forms are sections over modular curves carrying the universal
  weight-1 VHS; this roadmap supplies the fiber Hodge-structure side (and its successor the
  VHS/period-map side).
- **`ContourIntegration` (PR #35).** Periods of the concrete instances are contour integrals —
  consumed when realizing examples (the weight-1 period matrices).

## Downstream

Downstream *applications* that consume this library (motivation, not milestones of this roadmap):
the variations theory (the *Successor roadmap* above); periods and period maps; the Hodge conjecture's
setting; mixed Hodge modules and motives; mirror symmetry; modular/Shimura varieties; and the concrete
**weight-1 / curve** realization (Jacobians, period matrices, Riemann bilinear relations) — the worked
instance of L0–L3 at `n = 1`, and the point of contact with the Seiberg–Witten period story.

## References

Voisin, *Hodge Theory and Complex Algebraic Geometry I–II*. Carlson–Müller-Stach–Peters, *Period
Mappings and Period Domains*. Griffiths, *Periods of integrals on algebraic manifolds (I, II)* and
*Topics in transcendental algebraic geometry*. Deligne, *Théorie de Hodge II, III*. Schmid, *Variation
of Hodge structure: the singularities of the period mapping*. Peters–Steenbrink, *Mixed Hodge
Structures*. Alongside Booker Smith's Lean 4 *pure-hodge-structures-lean4* at the **L0** layer (see
*Prior art*); the L1–L3 polarization / mixed / period-domain superstructure is original. (Schmid is a
reference for the successor variations roadmap.)

---

*NOTE: `Suggested.lean` proposes the core definitions (the chief deliverable of this entry) with a
genuine milestone `sorry` at **L0, L1, L2, L3** (four milestones; the variations/rigidity material is
the successor roadmap and is not seeded here). The Hodge structure carries its integral lattice `V_ℤ`
as primary datum; the definitions are stated against the abstract **`IsBaseChange` interface** (see
*Conventions*) — every structure is parametric over an abstract `V_ℂ` with `hℂ : IsBaseChange ℂ ιℂ`
(and `V_ℚ` with `IsBaseChange ℚ ιℚ` where the tower is used) — with the concrete tensor
`V_ℂ = ℂ ⊗ V_ℤ` as the canonical instance, witnessed by `complexificationMap_isBaseChange`
(`TensorProduct.isBaseChange`). The canonical conjugation `latticeConj` is *defined* by transporting the
concrete lattice conjugation through `hℂ.equiv` (proven to fix `ιℂ(V)` and be involutive); the `ℤ→ℚ→ℂ`
tower and each construction are transported the same way, grounded in Mathlib's base-change vocabulary
throughout (`IsBaseChange`, `BilinForm.baseChange`, `Submodule.baseChange`, `cancelBaseChange`).
Effectivity is a named predicate `HodgeStructure.IsEffective`; polarization is split into the `Prop`
mixin `IsPolarization hs Qint` and the bundled `Polarization`; `PeriodDomain.Point` predicates the
*fixed* form via `IsPolarization` (no duplicated form); the symmetry group `Aut(V, Qint)` is exposed as
`IsLatticeIsometry` for the successor. The MHS `graded_pure` axiom is fully encoded (real induced purity
on the rational `gr^W_k`). The signatures elaborate against `TauCetiRoadmap`'s pinned Mathlib; every
definition is complete (no `sorry` in any definition), and the milestone `example`s carry `sorry`.*

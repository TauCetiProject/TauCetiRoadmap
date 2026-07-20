# Roadmap: variation of Hodge structure (general)

The narrative roadmap for **Hodge theory's linear-algebraic core and the abstract theory of its
variations**, at general weight, as a reusable library; `Suggested.lean` states the milestones as
`sorry`-goals. Its summit in the pure theory is the **semisimplicity of polarized Hodge structures**
(Hodge–Riemann), and in the mixed theory Deligne's **strictness**; on top sits the abstract framework
of **variations of Hodge structure** (period domains, period maps, monodromy). Written to the roadmap
conventions: build the library not one theorem, ground in Mathlib's vocabulary, pin conventions up
front, and — because this is a subject Mathlib has *nothing* on — get the **definitions** right (the
`JacobianChallenge` philosophy: the definitions are the deliverable).

**Mathlib has no Hodge structures at all** — no pure or mixed Hodge structures, no polarizations, no
Hodge–Riemann relations, no period domains, no variations, no period maps, no Griffiths transversality.
It has exactly the linear-algebra and geometry *prerequisites*, and this roadmap is built on them
(named in *Prior art*). The goal is that a researcher in Hodge theory, periods, modular forms, motives,
or mathematical physics finds pure and mixed Hodge structures, polarizations, period domains, and
variations (with the period map and monodromy) at their natural generality with full basic API — so
that the structural theorems are *consequences of a developed library*, not isolated endpoints.

Crucially, **this entry is the *structural* theory only.** Everything below is formalizable as linear
algebra + filtrations + local systems, with **no deep analysis or geometry**. The two deep inputs that
*produce* Hodge structures —

- the **Hodge decomposition** of a compact Kähler manifold (`Hⁿ = ⊕ H^{p,q}`, harmonic theory), and
- **Gauss–Manin** for a general smooth projective family (fibers' cohomology ⇒ a variation),

— together with **Schmid's asymptotic theory** (nilpotent/`SL₂`-orbit theorems, limiting MHS) are
**out of scope** here; they are the geometric/analytic engines that supply *instances*. The framework
defines what a Hodge structure and a variation *are* and proves their structural properties; concrete
instances come from elsewhere (the weight-1 / abelian-variety case — curves and their Jacobians — is
the worked model; see *Relation to sibling roadmaps*).

Suggested home: `TauCeti/Geometry/Hodge/` (`…/Hodge/Structure.lean`, `…/Polarization.lean`,
`…/Mixed.lean`, `…/PeriodDomain.lean`, `…/Variation.lean`).

## Prior art

- **Mathlib — the prerequisites this entry consumes (nothing on Hodge theory itself).**
  - Tensor/base change: the complexification is stated via **`IsBaseChange`** (`Module.IsBaseChange`;
    the `ℤ→ℚ→ℂ` tower composes by `IsBaseChange.comp`), with the **canonical instance** the concrete
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
  - **Incoming Mathlib filtration / complex-structure API (build *toward* it; track, don't consume yet).**
    Hodge-adjacent linear algebra is landing in Mathlib now; L0/L2 should be **refactored onto it once it
    merges** rather than duplicating it long-term:
    - *Filtration API* — [mathlib4#33954](https://github.com/leanprover-community/mathlib4/pull/33954),
      formalizing Deligne, *Théorie de Hodge II* §1.1, is explicitly PR 1/4 with **opposed filtrations
      (§1.2.1–1.2.3)** and **induced filtrations on graded pieces (§1.2.1)** named as the follow-ups —
      exactly what L0's `opposed` (`IsCompl (F^p) (conj F^{n+1−p})`) and L2's `gradedF` /
      `gradedComplexEquiv` build by hand here. That PR lives in an abstract abelian category while this
      roadmap is concrete over `Submodule ℂ V_ℂ`, so it is **not consumed verbatim today**; the plan is to
      specialize L0/L2 from it once merged and **align naming with Deligne §1.2.1**. (Grew out of Joël
      Riou's `n`-opposed-filtrations proposal on the `#mathlib4` *Complexifications with a view towards
      Hodge theory* thread.)
    - *Complex structures on real vector spaces* —
      [mathlib4#40975](https://github.com/leanprover-community/mathlib4/pull/40975), the `J`, `J² = −1`
      route to the `(p,q)`-decomposition (the `±i`-eigenspace picture). The Deligne opposed-filtration
      route taken here (L0 `piece`, per Riou's recommendation) and the `J`-eigenspace route yield the
      **same** decomposition; the L0 *instance bridge* note records how weight-1 / abelian-variety
      instances carrying a `J` plug in.
  - For variations (L4, downstream): `CategoryTheory.FundamentalGroupoid`, `Module ℤ` (local systems),
    and Mathlib's complex-manifold / connection API (Griffiths transversality).
  - Rigidity engine (L5): `Module.End`, `Module.End.HasEigenvalue` / `Module.End.exists_eigenvalue`
    over the algebraically closed `ℂ`.
- **Other proof assistants.** Hodge structures, polarizations, and variations of Hodge structure are
  largely unformalized (Isabelle/HOL, Coq/Rocq); adjacent pieces exist (abelian varieties, the upper
  half-space). In Lean 4, **concurrent** work by Booker Smith
  ([pure-hodge-structures-lean4](https://github.com/thebookersmith/pure-hodge-structures-lean4),
  [announcement](https://leanprover.zulipchat.com/#narrow/channel/583339-AI-authored-projects/topic/Pure.20Hodge.20structures.20in.20Lean.204))
  formalizes exactly the **L0** layer — the `(p,q)`-decomposition ↔ opposed-filtration equivalence,
  both directions, axiom-clean — taking the `ℚ`-space as primary where this roadmap takes the
  `ℤ`-lattice; it is a useful cross-check for the L0 signature. The polarization / mixed / period-
  domain / variation superstructure (L1–L5) remains new foundational material, not a port.
- **The weight-1 instance is concrete and reachable.** Polarized weight-1 Hodge structures are
  abelian varieties / complex tori `ℂ^g/Λ`; their period domain is the **Siegel upper half space**;
  their integral symmetry group is `Sp(2g, ℤ)`. That case (periods of curves, Jacobians) is a worked
  realization of the framework's weight-1 interface and is being developed concretely — evidence the
  abstract definitions are instantiable.

## Core definitions (the chief deliverable)

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
  `ℂ ⊗ Hⁿ(X;ℤ)`) satisfies the predicate directly, decisive for the L4 variations whose fibers are
  cohomology; and (ii) the nested-tower pain below is dissolved by transitivity of base change
  (`IsBaseChange.comp`) rather than a hand-threaded `cancelBaseChange`. The integral lattice `V_ℤ`
  stays the primary datum — `IsBaseChange` is a predicate *about* the structure map out of it.
- **Conjugation is defined, not assumed.** `latticeConj : V_ℂ →ₛₗ[starRingEnd ℂ] V_ℂ` is the unique
  conjugate-linear map fixing the integral points, `latticeConj (ι_ℂ v) = ι_ℂ v` — determined by the
  base-change universal property. On the canonical tensor instance it is
  `TensorProduct.map (starRingEnd ℂ) id` (`z ⊗ v ↦ z̄ ⊗ v`), with `map_smul` and
  `latticeConj_involutive` **proved**. The `n`-opposedness `IsCompl (F^p) (conj F^{n+1-p})` and the
  `(p,q)`-piece `F^p ⊓ conj(F^{n-p})` use this canonical map.
- **Polarization is one integral form.** `Polarization` stores a single
  `Qint : LinearMap.BilinForm ℤ V`; its complex form is **derived**, `Q := Qint.baseChange ℂ`, so the
  integral↔complex link is Mathlib's `baseChange_tmul`, not a hand-imposed axiom. `(-1)^n`-symmetry
  lives on `Qint`; `nondegenerate` is `BilinForm.Nondegenerate`; `orthogonal` is `BilinForm.IsOrtho`;
  the Hodge–Riemann positivity `i^{p−q} Q(v, v̄) > 0` on `H^{p,q}` is a real-and-positive condition.
- **Rational substructures derive their complexification.** A `RationalHodgeSubstructure` carries only
  its `ℚ`-subspace `WQ`; the complex side `WC := rationalToComplexSubmodule WQ` is its base change along
  the `ℚ→ℂ` structure map — so there is no bare-`Prop` "is the complexification" placeholder. Likewise
  the mixed weight filtration.
  *Implementation note:* under the base-change interface the two-step `ℤ→ℚ→ℂ` tower composes by
  `IsBaseChange.comp`, removing most of the ergonomic weight the concrete nested tensor
  `ℂ ⊗_ℚ (ℚ ⊗_ℤ V)` carried (no hand-threaded `cancelBaseChange`); the implementation should still
  carry a `@[simp]` suite for moving elements through `rationalToComplexSubmodule` and `Polarization.Q`
  (the `Q_tmul` pure-tensor lemma is the first of these) to keep the L1/L2 proofs tractable.

## Generality bar (decide up front; do not silently specialize)

- **Weight-general, polarized, integral.** State pure Hodge structures for arbitrary weight `n : ℤ` on
  the integral lattice; `ℚ`/`ℝ` variants are base changes. Do **not** hardcode weight 1 — weight 1 is
  the *example*, not the definition. Semisimplicity is stated over `ℚ`; monodromy lands in `Aut(V_ℤ, Q)`
  (integral automorphisms preserving the form).
- **Period domains à la Griffiths.** The classifying space `D` of polarized Hodge structures of a fixed
  Hodge type is a homogeneous space `G_ℝ/V`, open in a flag variety; weight 1 recovers Siegel
  (`Sp(2g,ℝ)/U(g)`). Build `D` at general type; do not collapse to Siegel.
- **Variations are abstract.** A VHS is a local system + a holomorphic Hodge-filtration bundle +
  **Griffiths transversality** (`∇F^p ⊆ F^{p−1}⊗Ω¹`), over a complex-manifold base — *defined*, not
  produced from geometry.
- **Stop at the structural theory.** Hodge decomposition for Kähler manifolds, Gauss–Manin of general
  families, and Schmid's asymptotics are **explicitly downstream** — name them, don't bake them in.

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
  (`Q(F^p, F^{n−p+1}) = 0`; `i^{p−q} Q(v, v̄) > 0` on `V^{p,q}`).
- **Mixed:** an increasing weight filtration `W_•` (over `ℚ`) + decreasing `F^•` inducing a pure
  weight-`k` HS on each `gr^W_k`.
- **Symmetry group / monodromy:** `G = Aut(V, Q)`; monodromy of a VHS is `ρ : π₁(B) → G(ℤ)`.

## Layers (each a discharge-gated milestone; the `sorry` goal in `Suggested.lean` is the target)

- **L0 — Pure Hodge structures; the Hodge decomposition.**
  *Definitions:* `HodgeStructure V n` (the `n`-opposed bounded filtration), `piece p = F^p ⊓ conj(F^{n−p})`.
  *Milestone:* `DirectSum.IsInternal hs.piece` — the `(p,q)`-pieces are an internal direct sum
  `V_ℂ = ⨁_p H^{p,q}`.
  *Discharge:* the standard equivalence "`n`-opposed filtration ⟺ `(p,q)`-decomposition." From
  `opposed` (`IsCompl (F^p) (conj F^{n+1−p})`) plus boundedness, prove by descending induction on `p`
  that `F^p = ⨆_{p'≥p} H^{p',·}` and that the pieces are independent (`H^{p,q} ⊓ ⨆_{p'>p} H^{p',·} = ⊥`
  from opposedness); assemble via `DirectSum.isInternal_submodule_iff_iSupIndep_and_iSup_eq_top`,
  `iSupIndep`, `IsCompl`. Voisin I, §6 (the opposedness lemma). Align `opposed` with Deligne §1.2.1 and
  plan to specialize it from [mathlib4#33954](https://github.com/leanprover-community/mathlib4/pull/33954)
  once merged (see *Prior art*). *Companions to build:* morphisms of HS, the `(p,q)` symmetry
  `conj (piece p) = piece (n−p)`, `ℤ`-Tate twist, `⊗`/`Hom`/dual.
  *Instance bridge (weight 1):* a weight-1 / abelian-variety HS naturally carries a complex structure `J`
  (`J² = −1`); its `±i`-eigenspaces are exactly the `(1,0)`/`(0,1)` pieces, so `piece` agrees with the
  `J`-eigenspace decomposition of
  [mathlib4#40975](https://github.com/leanprover-community/mathlib4/pull/40975). The roadmap consumes the
  Deligne opposed-filtration route (`piece = F^p ⊓ conj(F^{n−p})`, per Riou); `#40975` instances supply
  the `J`, so weight-1 examples can be produced either way and the two agree.
- **L1 — Polarization & Hodge–Riemann; semisimplicity (summit of the pure theory).**
  *Definitions:* `Polarization hs` (integral `Qint`, derived `Q`, HR relations),
  `RationalHodgeSubstructure`.
  *Milestone:* every rational Hodge substructure `W` has an orthogonal rational Hodge-substructure
  complement (`IsCompl` on both `WQ` and `WC`, `Q`-orthogonal) — hence **the category of polarized
  `ℚ`-HS is semisimple.**
  *Discharge:* the Hodge–Riemann positivity makes `h(u,v) := i^{p−q} Q(u, v̄)` a positive-definite
  Hermitian form on each piece, so `V_ℂ` carries a definite Hermitian form for which `conj`/`Q` are
  compatible; the `Q`-orthogonal complement of a sub-HS is again a sub-HS, and (since `Q` is rational
  and nondegenerate) it is defined over `ℚ`. `V = W ⊕ W^⊥`. Consume the `BilinForm.Nondegenerate`
  orthogonal-complement API and the L0 decomposition. Voisin I, §7.1.2; Peters–Steenbrink §2.
- **L2 — Mixed Hodge structures; strictness (Deligne).**
  *Definitions:* `MixedHodgeStructure V` — the `ℚ`-weight filtration `WQ` (monotone and **bounded**,
  `WQ_top`/`WQ_bot`), the Hodge filtration `F` (antitone and **bounded**, `F_top`/`F_bot`, mirroring
  `HodgeStructure`), and `graded_pure`. The complexified weight `WC_k := rationalToComplexSubmodule (WQ_k)`
  is *derived*, and its monotonicity and conjugation-stability are **proved lemmas**
  (`rationalToComplexSubmodule_mono`, `…_conj`), not structure fields — so instances are
  correct-by-construction, not burdened with re-proving them. `graded_pure` is the **genuine
  induced-purity axiom, stated rationally** (not a placeholder, and not merely the complex shadow): the
  *rational* graded piece `grᵂ_k = W_{ℚ,k}/W_{ℚ,k-1}` is built as a `ℚ`-quotient (`weightGradedRat`),
  its complexification `ℂ ⊗_ℚ grᵂ_k` (`ratComplexify`) carries the canonical rational conjugation
  `ratConj` (bundled as a conjugate-linear **equivalence** `gradedConj`, involutivity proved), `F`
  induces a filtration `gradedF` on it, and `graded_pure` requires that induced filtration to be
  **bounded, antitone, and `k`-opposed** with respect to `gradedConj` — structurally identical to
  `HodgeStructure` (`F_top`/`F_bot` + `F_antitone` + `opposed`). The complex weight quotient
  `WC_k/WC_{k-1}` is **identified** with `ℂ ⊗_ℚ grᵂ_k` by a *proved* isomorphism `gradedComplexEquiv`
  (complexification commutes with the quotient — `tensorQuotientEquiv` / right-exactness composed with
  the per-level `ℂ ⊗_ℚ W ≃ WC` iso). So an MHS genuinely induces a pure *rational* Hodge structure on
  each graded — the correct object, not just its complexification.
  *Milestone:* a morphism of MHS is **strict** for the weight filtration (at both the **rational** level
  `range fQ ⊓ W'_{ℚ,k} = fQ(W_{ℚ,k})` and its complexification) **and** the Hodge filtration
  `range f_ℂ ⊓ F'^p = f_ℂ(F^p)`. The morphism is a **single rational map**
  `fQ`; its complex action is the *derived* `fC := rationalMapToComplex fQ`, whose conjugation-equivariance
  and `WC`-compatibility are **proved lemmas** (`rationalMapToComplex_conj`, `…_maps_WC`) rather than
  hypotheses. So the target is Deligne strictness for a genuine rational MHS morphism, not for an
  arbitrary pair of filtered maps.
  *Discharge:* Deligne's canonical `(p,q)`-bigrading of an MHS (the Deligne splitting) — every MHS
  morphism respects the bigrading, whence strictness for both filtrations. Requires the two-filtration
  / bigrading lemma. For the roadmap it suffices to establish the splitting *propositionally* (existence
  of the `I^{p,q}` bigrading), not as a computational normal form. A `@[simp]` suite for pushing
  elements through `gradedConj`/`gradedF` (as with `Polarization.Q_tmul`) will be wanted to keep the
  quotient manipulations tractable. Deligne, *Théorie de Hodge II*, 1.2.10 & 2.3.5; Peters–Steenbrink
  Ch. 3. The `gradedF` / `gradedComplexEquiv` apparatus is Deligne §1.2.1 "induced filtrations on graded
  pieces"; specialize it from
  [mathlib4#33954](https://github.com/leanprover-community/mathlib4/pull/33954)'s named §1.2.1 follow-up
  once merged, aligning naming with Deligne §1.2.1 (see *Prior art*).
  *Morphisms:* the milestone takes the morphism as a single unbundled rational map `fQ` (complex action
  derived), so the target is bundling-agnostic. The implementation should then bundle it into an
  `MHS.Hom` / category to carry the **abelian-category** structure — strictness is exactly what makes
  kernels and cokernels of MHS morphisms again MHS (with the induced filtrations).
- **L3 — Period domains.**
  *Definitions:* `HodgeType` (fixed Hodge numbers `h : ℤ → ℕ`, finite support),
  `PeriodDomain V n Qint htype` (a Hodge filtration for the **fixed** integral polarization form
  `Qint`, with the prescribed type). The form is not allowed to vary with the point of the domain.
  *Milestone (seeded):* the Hodge numbers partition the dimension, `∑ᶠ p, h p = dim_ℂ V_ℂ` — the
  numerical shadow of L0, a genuine constraint on `HodgeType`.
  *Discharge:* from L0 (`DirectSum.IsInternal`) plus `hodge_numbers` (`finrank (piece p) = h p`), the
  total dimension is the finsum of piece dimensions — additivity of `Module.finrank` over the internal
  direct sum (via `DirectSum.IsInternal` + `Module.finrank`/`Basis`); `Basis.baseChange` gives
  `dim_ℂ V_ℂ = rank_ℤ V`.
  *Out of scope (downstream, not a milestone):* the complex structure on `D` as an **open** subset of
  the flag variety of filtrations with the given ranks, the `G_ℝ`-action, and the weight-1 ⇒ Siegel
  identification — these need flag-variety topology Mathlib lacks; named as a downstream target, not
  seeded here.
- **L4 — Variations of Hodge structure.**
  *In-scope definition:* `PolarizedMonodromyRepresentation` — the honest monodromy facet
  (`ρ : Γ →* (V ≃ₗ[ℤ] V)` preserving `Qint`, with the derived `complexMonodromy : Γ →* (V_ℂ ≃ₗ[ℂ] V_ℂ)`).
  This is the concrete **pre-variation** deliverable (local system + monodromy + integral form); it
  lands independently of any analytic input and is what the L5 Schur milestone consumes.
  *Milestone:* **none self-contained** at L4; the provable engine L4 contributes to the rigidity theory
  is the **L5 Schur** lemma below.
  *Out of scope (downstream, not seeded):* the **full variation of Hodge structure** — a holomorphic
  Hodge-filtration bundle over `B` with Griffiths transversality (`∇F^p ⊆ F^{p−1}⊗Ω¹`) and the period
  map `B̃ → D` (holomorphic, horizontal). These analytic conditions **cannot yet be stated** in Lean
  (they need Mathlib's complex-manifold / connection API), so per the roadmap convention they are
  **omitted** here rather than installed as content-free `Prop` placeholders — `Suggested.lean` seeds
  only the monodromy facet, and carries no schematic full-VHS structure. When that API exists the local
  system is modelled as a functor `CategoryTheory.FundamentalGroupoid B ⥤ Module ℤ` (on a connected
  base, a `π₁(B, b₀)`-representation on the fiber), the filtration bundle + Griffiths transversality
  build on the complex-manifold / connection API, and the full `VariationOfHodgeStructure` datum becomes
  stateable — at which point it moves in-scope.
- **L5 — Rigidity & semisimplicity.** Two tiers, kept distinct:
  *(i) the linear-algebraic engine (the milestone):* **finite-dimensional Schur** — if
  `complexMonodromy` is irreducible then its commutant is scalar (`∃ c, ∀ v, T v = c • v`).
  *Discharge:* over the algebraically closed `ℂ`, a commuting endomorphism `T` of a finite-dimensional
  irreducible representation has an eigenvalue (`Module.End.exists_eigenvalue`); `ker (T − c)` is a
  nonzero invariant subspace, hence everything, so `T = c`. Consume `Module.End.HasEigenvalue`,
  invariant-subspace API.
  *(ii) Out of scope (downstream, not milestones):* period-map **rigidity** and Deligne's **theorem of
  the fixed part** / semisimplicity of monodromy. These need actual *polarizable VHS* hypotheses (a real
  variation, not merely a form-preserving representation), so they depend on the out-of-scope L4
  analytic layer above; named as downstream targets, not seeded here.

## Relation to sibling roadmaps

- **`JacobianChallenge` (AG Jacobian).** Complementary, not overlapping: that entry builds
  `Jac = Pic⁰` as a *scheme* via the Abel–Jacobi universal property; this entry is the *transcendental*
  Hodge theory. They meet at one bridge — over `ℂ`, `Jac(X)(ℂ) ≅ ℂ^g/period-lattice` (the weight-1
  instance) — a natural joint target, not a duplication.
- **`ModularForms` (PR #47).** Modular forms are sections over modular curves carrying the universal
  weight-1 VHS; this framework supplies the VHS/period-map side.
- **`ContourIntegration` (PR #35).** Periods of the concrete instances are contour integrals —
  consumed when realizing examples (the weight-1 period matrices).

## Downstream

Periods and period maps; the Hodge conjecture's setting; mixed Hodge modules and motives; mirror
symmetry; modular/Shimura varieties; and the concrete **weight-1 / curve** realization (Jacobians,
period matrices, Riemann bilinear relations) — the worked instance of L0–L4 at `n = 1`, and the point
of contact with the Seiberg–Witten period story.

## References

Voisin, *Hodge Theory and Complex Algebraic Geometry I–II*. Carlson–Müller-Stach–Peters, *Period
Mappings and Period Domains*. Griffiths, *Periods of integrals on algebraic manifolds (I, II)* and
*Topics in transcendental algebraic geometry*. Deligne, *Théorie de Hodge II, III*. Schmid, *Variation
of Hodge structure: the singularities of the period mapping*. Peters–Steenbrink, *Mixed Hodge
Structures*. New Lean formalization; concurrent with Booker Smith's Lean 4
*pure-hodge-structures-lean4* at the **L0** layer (see *Prior art*), original for the L1–L5
polarization / mixed / period-domain / variation superstructure.

---

*NOTE: `Suggested.lean` proposes the core definitions (the chief deliverable of this entry) with a
genuine milestone `sorry` at **L0, L1, L2, L3, L5**. The Hodge structure carries its integral lattice
`V_ℤ` as primary datum; the complexification is pinned to the **`IsBaseChange` interface** (see
*Conventions*) with the concrete tensor `V_ℂ = ℂ ⊗ V_ℤ` as the canonical instance `Suggested.lean`
currently encodes (interface-parametrizing the definitions is the planned refactor), and a *defined*
canonical conjugation `latticeConj`; it is grounded in Mathlib's base-change vocabulary throughout
(`IsBaseChange`, `BilinForm.baseChange`, `Submodule.baseChange`, `cancelBaseChange`). **L4**
seeds only the honest monodromy facet `PolarizedMonodromyRepresentation` — it has **no self-contained
provable milestone**, because period-map horizontality / Griffiths transversality is analytic and out
of scope; its provable engine is the L5 Schur lemma. The full VHS structure is **not stated**: its
analytic conditions cannot yet be expressed, so per the roadmap convention they are omitted rather than
installed as content-free `Prop` placeholders. The MHS `graded_pure` axiom is fully encoded (real
induced purity on the rational `gr^W_k`). Elaborated green against `TauCetiRoadmap`'s pinned Mathlib
(leanprover/lean4:v4.31.0-rc1); every definition is complete (no `sorry` in any definition) and
axiom-clean (only `propext`, `Classical.choice`, `Quot.sound`); the milestone `example`s carry `sorry`.*

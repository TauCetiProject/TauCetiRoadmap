# Roadmap: variation of Hodge structure (general)

*A Tau Ceti roadmap entry (`TauCetiRoadmap/VHS/` — this `README.md` + `Targets.lean`). Scope: the
**general, weight-general abstract framework** of Hodge structures and their variations — the
structural/linear-algebraic theory that Mathlib entirely lacks. Written to the roadmap conventions:
build the library not one theorem, ground in Mathlib's vocabulary, pin conventions up front, get the
**definitions** right (the hardest and most valuable part here), write Lean signatures.*

**Mathlib has no Hodge structures at all** — no pure or mixed Hodge structures, no polarizations,
no period domains, no variations, no period maps. It has the prerequisites (`Module`, filtrations
via `Submodule` lattices, complexification `⊗ ℂ`, `Matrix.PosDef`, local systems / fundamental
group, complex manifolds). The goal is to build **Hodge theory's linear-algebraic core and the
abstract theory of its variations**, at general weight, as a reusable library — so that a
researcher in Hodge theory, periods, modular forms, motives, or mathematical physics finds pure
and mixed Hodge structures, polarizations, period domains, and variations (with the period map and
monodromy) at their natural generality.

Crucially, **this entry is the *structural* theory only.** Everything below is formalizable as
linear algebra + filtrations + local systems, with **no deep analysis or geometry**. The two deep
inputs that *produce* Hodge structures —

- the **Hodge decomposition** of a compact Kähler manifold (`Hⁿ = ⊕ H^{p,q}`, harmonic theory), and
- **Gauss–Manin** for a general smooth projective family (fibers' cohomology ⇒ a variation),

— and **Schmid's asymptotic theory** (nilpotent/`SL₂`-orbit theorems, limiting MHS) are **out of
scope** here; they are the geometric/analytic engines that supply *instances*. The framework
defines what a variation *is* and proves its structural properties; concrete instances come from
elsewhere (the weight-1 / abelian-variety case — curves and their Jacobians — is the worked model;
see *Relation to sibling roadmaps*).

Suggested home: `TauCeti/Geometry/Hodge/` (`…/Hodge/Structure.lean`, `…/Polarization.lean`,
`…/Mixed.lean`, `…/PeriodDomain.lean`, `…/Variation.lean`).

## Prior art

- **Mathlib:** nothing on Hodge structures (only the linear-algebra/manifold prerequisites).
- **Other proof assistants:** Hodge structures and VHS appear essentially unformalized anywhere —
  this is new foundational material, not a port.
- **The weight-1 instance is concrete and reachable.** Polarized weight-1 Hodge structures are
  abelian varieties / complex tori `ℂ^g/Λ`; their period domain is the **Siegel upper half space**;
  their integral symmetry group is `Sp(2g, ℤ)`. That case (periods of curves, Jacobians) is a
  worked realization of the framework's weight-1 interface and is being developed concretely —
  evidence the abstract definitions are instantiable.

## Generality bar (decide up front; do not silently specialize)

- **Weight-general, polarized, integral.** State pure Hodge structures for arbitrary weight `n`,
  on a finitely-generated `ℤ`-module (rational/real variants by base change). Do **not** hardcode
  weight 1; weight 1 is the *example*, not the definition. **The integral lattice is primary datum:**
  `Targets.lean` carries the lattice `V_ℤ` (a finitely-generated free `ℤ`-module), with the
  complexification `V_ℂ = V_ℤ ⊗ ℂ` and its *canonical* conjugation (not a free-floating `conj`), the
  polarization the `ℂ`-extension of a form on `V_ℤ`, semisimplicity stated over `ℚ`, and monodromy
  landing in `Aut(V_ℤ, Q)`. Do **not** reduce a Hodge structure to a bare `(V_ℂ, conj)` pair.
- **Period domains à la Griffiths.** The classifying space `D` of polarized Hodge structures of a
  fixed Hodge type is a homogeneous space `G_ℝ/V`, open in a flag variety; weight 1 recovers Siegel
  (`Sp(2g,ℝ)/U(g)`). Build `D` at general type; do not collapse to Siegel.
- **Variations are abstract.** A VHS is a local system + a holomorphic Hodge-filtration bundle +
  **Griffiths transversality** (`∇F^p ⊆ F^{p−1}⊗Ω¹`), over a complex-manifold base — *defined*,
  not produced from geometry.
- **Stop at the structural theory.** Hodge decomposition for Kähler manifolds, Gauss–Manin of
  general families, and Schmid's asymptotics are **explicitly downstream** — name them, don't bake
  them in.

## Conventions (pinned)

- **Hodge filtration as the primary datum.** A weight-`n` HS on `V` is a decreasing filtration
  `F^•` on `V_ℂ = V ⊗ ℂ` that is **`n`-opposed**: `F^p ⊕ \overline{F^{n+1−p}} = V_ℂ` for all `p`
  (equivalently the `(p,q)`-decomposition with `V^{q,p} = \overline{V^{p,q}}`). Conjugation is the
  real structure on `V_ℂ`.
- **Polarization:** a `(−1)^n`-symmetric integral form `Q` with the **Hodge–Riemann relations**
  (`Q(F^p, F^{n−p+1}) = 0`; `i^{p−q} Q(v, v̄) > 0` on `V^{p,q}`).
- **Mixed:** an increasing weight filtration `W_•` (over `ℚ`) + decreasing `F^•` inducing a pure
  weight-`k` HS on each `gr^W_k`.
- **Symmetry group / monodromy:** `G = Aut(V, Q)`; monodromy of a VHS is `ρ : π₁(B) → G(ℤ)`.

## Layers (each a discharge-gated milestone; `sorry` in `Targets.lean` is the goal)

- **L0 — Pure Hodge structures.** Define weight-`n` HS via the `n`-opposed filtration; the
  equivalence with the `(p,q)`-decomposition; morphisms; `ℤ`-Tate twist; `⊗`, `Hom`, dual.
- **L1 — Polarization & Hodge–Riemann; semisimplicity.** Polarized HS and the Hodge–Riemann
  bilinear relations; **the category of polarized `ℚ`-HS is abelian and semisimple** (every
  sub-HS is a direct summand) — the structural summit of the pure theory.
- **L2 — Mixed Hodge structures.** `W_•`+`F^•` with pure gradeds; the abelian category MHS;
  **strictness** of morphisms (Deligne).
- **L3 — Period domains.** The classifying space `D` of polarized HS of fixed Hodge type; its
  complex structure as an open subset of a flag variety; the `G_ℝ`-action; weight-1 ⇒ Siegel.
- **L4 — Variations of Hodge structure.** Abstract VHS over a complex base (local system +
  filtration bundle + Griffiths transversality); the **period map** `B̃ → D` (holomorphic,
  horizontal) and **monodromy** `ρ : π₁(B) → G(ℤ)`.
  *Mathlib interface:* model the **local system** as a functor from the fundamental groupoid
  `CategoryTheory.FundamentalGroupoid B` to `Module ℤ` (equivalently, on a connected base, a
  `π₁(B,b₀)`-representation on the fiber — Mathlib's `FundamentalGroup` / `MonoidHom`); the
  filtration bundle and Griffiths transversality build on Mathlib's complex-manifold + connection
  API. `Targets.lean` records only the monodromy-representation facet (`PolarizedMonodromyRepresentation`).
- **L5 — Rigidity & semisimplicity.** Two tiers, kept distinct: (i) the **linear-algebraic engine**
  — finite-dimensional Schur (irreducible representation ⇒ scalar commutant), the milestone stated
  in `Targets.lean`; and (ii) the **genuine theorems** that invoke it — period-map rigidity and
  Deligne's *theorem of the fixed part* / semisimplicity of monodromy — which require actual
  *polarizable VHS* hypotheses (a real variation, not merely a form-preserving representation) and
  are the deeper targets, not the Schur lemma itself.

## Relation to sibling roadmaps

- **`JacobianChallenge` (AG Jacobian).** Complementary, not overlapping: that entry builds
  `Jac = Pic⁰` as a *scheme* via the Abel–Jacobi universal property; this entry is the
  *transcendental* Hodge theory. They meet at one bridge — over `ℂ`,
  `Jac(X)(ℂ) ≅ ℂ^g/period-lattice` (the weight-1 instance) — a natural joint target, not a
  duplication.
- **`ModularForms` (PR #47).** Modular forms are sections over modular curves carrying the
  universal weight-1 VHS; this framework supplies the VHS/period-map side.
- **`ContourIntegration` (PR #35).** Periods of the concrete instances are contour integrals —
  consumed when realizing examples.

## Downstream

Periods and period maps; the Hodge conjecture's setting; mixed Hodge modules and motives; mirror
symmetry; modular/Shimura varieties; and the concrete **weight-1 / curve** realization (Jacobians,
period matrices, Riemann bilinear relations) — the worked instance of L0–L4 at `n = 1`.

## References

Voisin, *Hodge Theory and Complex Algebraic Geometry I–II*. Carlson–Müller-Stach–Peters, *Period
Mappings and Period Domains*. Griffiths, *Periods of integrals on algebraic manifolds (I, II)* and
*Topics in transcendental algebraic geometry*. Deligne, *Théorie de Hodge II, III*. Schmid,
*Variation of Hodge structure: the singularities of the period mapping*. Peters–Steenbrink,
*Mixed Hodge Structures*.

---

*NOTE: `Targets.lean` proposes the core definitions (the chief deliverable of this entry) with a
genuine milestone `sorry` at **L0, L1, L2, L3, L5**. The Hodge structure carries its integral lattice
`V_ℤ` as primary datum, with `V_ℂ = ℂ ⊗ V_ℤ` and a *defined* canonical conjugation `latticeConj`.
**L4** contributes the honest monodromy facet (`PolarizedMonodromyRepresentation` on the lattice) plus
a schematic `VariationOfHodgeStructure` structure seed — it has **no self-contained provable
milestone**, because period-map horizontality / Griffiths transversality is analytic and out of scope;
its provable engine is the L5 Schur lemma. Remaining schematic debt is marked `TODO(review)` in-file
(MHS `graded_pure`'s induced datum; the ℚ↔ℂ comparison in `RationalHodgeSubstructure`; period-domain
openness). Elaborated green against `TauCetiRoadmap`'s pinned Mathlib (v4.31); re-check when filing.*

module

public import Mathlib
public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic

/-!
# Yang–Mills connections and the caloric gauge: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti. Two are stated: the integrality of the instanton number
of a finite-energy `SU(2)` connection on `ℝ⁴`, and the existence of such connections of every
integer instanton number (§6.4). The other headlines are not stated; each is listed below with
what it needs beyond the three definitions kept here.

By §3.3 every finite-energy connection on `ℝ⁴` has a global potential of class `W^{1,2}_loc`. The
pins have this order-one class: `TauCeti.HasWeakFDerivOn` is the weak derivative, and
`TauCeti.WeakDerivStep` over `Lᵖ(Ω; V)` is `W^{1,p}(Ω; V)` for a complete `V`. Its local version for
`𝔰𝔲(2)`-valued potentials, with finite energy, is the predicate `IsFiniteEnergySU2Potential`, the
matrices carrying the Frobenius norm for the weak derivative and square integrability being stated
entry by entry. For `SU(2)` with the trace form nothing more is needed: `𝔰𝔲(2)` is the trace-free
skew-Hermitian matrices (Tau Ceti's
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff`, for
`TauCeti.GLSpecialUnitary`, whose elements are those of `Matrix.specialUnitaryGroup` by
`TauCeti.GLSpecialUnitary.mem_iff`) and the inner product is the trace.

The other headlines need at least one of the following.

* (a) The critical gauge class `G^{2,d/2}_loc` (matrix-valued maps of local class `W^{2,d/2}` with
  values in `G` almost everywhere) and the gauge action `O·A = Ad(O)A − (∂O)O⁻¹` on it. The
  vector-valued classes of order two are requested of PDE (gap `vector-valued-wkp`); the
  order-two class at the pins, `TauCeti.Wkp`, is scalar.
* (b) A general structure group: the triple `(N, G, ⟨·,·⟩)` of §1.1, with the norm of forms, the
  characteristic number, the self-dual projection, the weak Yang–Mills equation and the structure
  constant `γ₀`, all formed with the prescribed `Ad(G)`-invariant inner product. The pins have
  closed subgroups of `GL_N(ℂ)` and their Lie algebras (`TauCeti.Lie.lieSubalgebraOfSubgroup`), but
  a general-`G` statement here would rebuild Layer 1 and §7.1 as definitions. An `SU(2)` case of
  a general-`G` headline is a Check, not a substitute.
* (c) The topological class `Top(d, G)`: gauges at infinity of class (a), modulo homotopy and the
  two-sided action of constants.
* (d) The realised homogeneous spaces `Ḣ^σ` and `Ẇ^{σ,p}`, the Besov spaces `ℓ¹L²` and `ℓ²L¹Ḣ^σ`, and
  the covariant operators on them. `TauCeti.D1p0` supplies only the scalar first-order space
  `Ḣ¹(ℝ⁴)`, and Mathlib's inhomogeneous Bessel-potential scale does not identify these spaces.

By layer:

* Layer 3, gauge invariance of curvature and of finite energy (§3.2): (a) and (b).
* Layer 4, Uhlenbeck's Coulomb gauge with uniqueness and continuity (§4.1), and Uhlenbeck's
  result on the punctured ball (§4.2): (a) and (b).
* Layer 5, the good global gauge (§5.2), the topological class with its well-definedness, gauge
  invariance and locality (§5.4), and the characterisation of the trivial class (§5.5): (a), (b)
  and (c). Mathlib's `ContinuousMap.Homotopic` gives free homotopy classes, but `HomotopyGroup`
  alone is not the quotient by the two-sided action of `G × G` that the class needs for
  disconnected `G`.
* Layer 6, topological invariance of characteristic numbers (§6.2): (b) and (c). The integrated
  Bogomol'nyi bound with its equality case (§6.3): (b). The injectivity half of §6.4 (equal
  instanton numbers give equal classes in `Top(4, SU(2))`): (c).
* Layer 7, regularity, removable singularities and decay of harmonic Yang–Mills connections
  (§§7.2–7.3): (a) and (b). The sharp energy gap (§7.5) and the attained ground state (§7.7): (b).
* Layer 8, the inverse of the covariant Laplacian (§8.2) and the covariant parabolic estimates
  with decay (§§8.3–8.4): (b) and (d).
* Layer 9, local well-posedness, stability and continuation (§§9.3–9.4), flat limits of the
  nonlinear and linearised flows (§9.5), and the Dichotomy (§9.6) and Threshold (§9.7) Theorems:
  (b) and (d), and in addition the solution carrier of the heat flow in the local caloric gauge on
  `Ḣ¹` (limits of regular solutions in `Ḣ¹ ∩ Ḣ³`) with its maximal lifespan and caloric size, the
  linearised limit operators with their operator-norm topology, and the convergence of rescaled
  flows to a harmonic bubble.
* Layer 10, flat connections as pure gauges and the caloric gauge (§§10.1–10.2), caloric bounds
  and the `C¹` split caloric manifold (§§10.3–10.4), and its tangent spaces with the nonlinear
  div–curl decomposition (§10.5): (a), (b) and (d), and in addition the Banach space `ℋ` (which
  needs `ℓ¹L²`), the caloric subset, the Banach space of continuous matrix functions vanishing at
  infinity with derivative in `Ḣ¹` used for normalised gauges, and the linearised heat-flow
  solution and limit operators. `Manifold.IsSmoothEmbedding` supplies the chart predicate, not these
  carriers.

The README states all these targets with their hypotheses, supplier contracts, APIs and Checks.
-/

public section

open MeasureTheory

attribute [local instance] Matrix.frobeniusNormedAddCommGroup Matrix.frobeniusNormedSpace

namespace TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge

/-! ## Layer 6: characteristic numbers and the instanton number -/

/-- The curvature `F_jk = ∂_j A_k − ∂_k A_j + [A_j, A_k]` (Conventions) of a potential `A` on `ℝ^d`
with values in `N × N` complex matrices, evaluated at `x`, where `DA` is a weak derivative of `A`
and `∂_j A_k` is the `k`-th component of `DA x` applied to the `j`-th coordinate vector. -/
noncomputable def curvature {d N : ℕ}
    (A : EuclideanSpace ℝ (Fin d) → Fin d → Matrix (Fin N) (Fin N) ℂ)
    (DA : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) →L[ℝ]
      (Fin d → Matrix (Fin N) (Fin N) ℂ))
    (x : EuclideanSpace ℝ (Fin d)) (j k : Fin d) : Matrix (Fin N) (Fin N) ℂ :=
  DA x (EuclideanSpace.single j 1) k - DA x (EuclideanSpace.single k 1) j +
    (A x j * A x k - A x k * A x j)

/-- `A` is a global potential on `ℝ⁴` of a finite-energy `SU(2)` connection, with weak derivative
`DA`: its four coefficients lie almost everywhere in `𝔰𝔲(2)` (skew-Hermitian and trace free), `A`
lies in `W^{1,2}_loc(ℝ⁴)` with weak derivative `DA`, and every curvature coefficient lies in `L²`.
By README §3.3 (OhTataru-TopClass Proposition 3.10) every finite-energy connection on a rough
`SU(2)`-bundle over `ℝ⁴` has such a global potential. -/
structure IsFiniteEnergySU2Potential
    (A : EuclideanSpace ℝ (Fin 4) → Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)
    (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ]
      (Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)) : Prop where
  /-- The coefficients are skew-Hermitian almost everywhere. -/
  conjTranspose_eq_neg : ∀ᵐ x, ∀ j, (A x j).conjTranspose = -A x j
  /-- The coefficients are trace free almost everywhere. -/
  trace_eq_zero : ∀ᵐ x, ∀ j, (A x j).trace = 0
  /-- `DA` is a weak derivative of `A` on `ℝ⁴`. -/
  hasWeakFDerivOn : TauCeti.HasWeakFDerivOn volume ⊤ A DA
  /-- Every entry of `A` and of its directional weak derivatives is square integrable on every
  compact set. -/
  memLp_restrict : ∀ K : Set (EuclideanSpace ℝ (Fin 4)), IsCompact K → ∀ (j : Fin 4) (a b : Fin 2),
    MemLp (fun x => A x j a b) 2 (volume.restrict K) ∧
      ∀ v, MemLp (fun x => DA x v j a b) 2 (volume.restrict K)
  /-- The energy is finite: every entry of every curvature coefficient is square integrable. -/
  memLp_curvature : ∀ (j k : Fin 4) (a b : Fin 2),
    MemLp (fun x => curvature A DA x j k a b) 2 volume

/-- The instanton number `c₂(a) = (8π²)⁻¹ ∫_{ℝ⁴} tr(F ∧ F)` (README §6.4): the integrand is the
coefficient of `dx¹ ∧ dx² ∧ dx³ ∧ dx⁴` in `tr(F ∧ F)`, namely
`2(tr(F₁₂F₃₄) − tr(F₁₃F₂₄) + tr(F₁₄F₂₃))`, which is real for `𝔰𝔲(2)`-valued curvature
(OhTataru-TopClass (1.24), lines 852–857). -/
noncomputable def instantonNumber
    (A : EuclideanSpace ℝ (Fin 4) → Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)
    (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ]
      (Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)) : ℝ :=
  (8 * Real.pi ^ 2)⁻¹ * ∫ x, (2 * ((curvature A DA x 0 1 * curvature A DA x 2 3).trace -
    (curvature A DA x 0 2 * curvature A DA x 1 3).trace +
    (curvature A DA x 0 3 * curvature A DA x 1 2).trace)).re

/-- **Integrality of the instanton number** (README §6.4; OhTataru-TopClass lines 256–264 and
858–860): the instanton number of every finite-energy `SU(2)` connection on `ℝ⁴` is an integer,
namely minus the degree of its gauge at infinity on `S³` for the orientations of the README's
Conventions. -/
theorem exists_int_instantonNumber_eq
    {A : EuclideanSpace ℝ (Fin 4) → Fin 4 → Matrix (Fin 2) (Fin 2) ℂ}
    {DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ]
      (Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)}
    (hA : IsFiniteEnergySU2Potential A DA) :
    ∃ n : ℤ, instantonNumber A DA = n := by
  sorry

/-- **Every integer is an instanton number** (README §6.4, the surjectivity half of the bijection
`Top(4, SU(2)) → ℤ`): for every integer `n` some finite-energy `SU(2)` connection on `ℝ⁴` has
instanton number `n`; one is the cut-off pure gauge of `x ↦ Φ(x/|x|)⁻ⁿ`. With
`exists_int_instantonNumber_eq` it says that the instanton number takes exactly the integer
values, which fixes the normalisation `(8π²)⁻¹`. -/
theorem exists_potential_instantonNumber_eq (n : ℤ) :
    ∃ (A : EuclideanSpace ℝ (Fin 4) → Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)
      (DA : EuclideanSpace ℝ (Fin 4) → EuclideanSpace ℝ (Fin 4) →L[ℝ]
        (Fin 4 → Matrix (Fin 2) (Fin 2) ℂ)),
      IsFiniteEnergySU2Potential A DA ∧ instantonNumber A DA = n := by
  sorry

end TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge

end

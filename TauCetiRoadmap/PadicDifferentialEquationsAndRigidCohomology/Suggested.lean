import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Rigid
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.RepresentationTheory.GaloisDescent.Injective
import TauCeti.RepresentationTheory.GaloisDescent.Span

/-!
# P-adic differential equations, rigid cohomology and p-adic weights: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti; it is not exhaustive. The
Robba rings, dagger algebras, differential and Frobenius modules, tubes, isocrystal categories and
rigid cohomology are README targets: their carriers do not exist at the pins, and formalising
them is the work this roadmap plans.

The statements on existing carriers include Katz’s cyclic-vector theorem, Kloosterman bounds
and weight-separated factor extraction. The definitions describe: the equivariance, monodromy and Tate-twist conditions on linear Frobenius operators;
valuation bases; Katz's cyclic-vector candidate; growth conditions separating convergent from
overconvergent coefficients; the Taylor convergence condition on an operator; indices of linear
maps; ι-weights of complex numbers and matrices; Kummer trace functions and Kloosterman sums;
and the rational and integral descent of power series used for Weil factors.

Design choices made explicit here. Frobenius is semilinear for a coefficient endomorphism,
and invertibility means invertibility of the linearisation. Bijectivity of the semilinear operator follows when the coefficient map
is an automorphism. Integral Frobenius isogenies have horizontal sections over the integral
constant ring; rigid tensor operations are rational or integral étale operations. Tate twists multiply the
linear q-Frobenius by q^(-n) and lower weights by 2n. Weil factors use `Matrix.charpolyRev`,
i.e. det(1 - T F). The monodromy convention is N φ = q φ N.
Uniformiser slopes convert to q-slopes by division by e · a, where e = v_π(p) and q = p^a.
The numerical highest break of the zero differential module is zero; the unequal-break tensor
formula requires both ranks positive, and the Artin–Schreier characterization requires positive rank.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

/-! ## Layer RD.0: Coefficient rings and analytic foundations -/

-- The p-power Witt-vector Frobenius; a q-power Frobenius lift with q = p^a is its a-th iterate on W(𝔽_q).
#check WittVector.frobenius

-- Cauchy convolution of coefficient families; on Laurent coefficients it needs summability before it is a ring multiplication.
#check DiscreteConvolution.ringConvolution


namespace RD0

section ValuationBasis

variable {K V ι ι' : Type*} [NormedField K]
  [NormedAddCommGroup V] [NormedSpace K V]

/-- Weighted finite-coordinate maximum on an existing algebraic basis. -/
def IsValuationBasis (b : Module.Basis ι K V) : Prop :=
  ∀ c : ι →₀ K, ‖b.repr.symm c‖₊ =
    c.support.sup (fun i => ‖c i • b i‖₊)

theorem IsValuationBasis.coordinate_le (b : Module.Basis ι K V)
    (hb : IsValuationBasis b) (x : V) (i : ι) :
    ‖(b.repr x) i‖ * ‖b i‖ ≤ ‖x‖ := by
  sorry

theorem IsValuationBasis.reindex_iff (b : Module.Basis ι K V) (e : ι ≃ ι') :
    IsValuationBasis (b.reindex e) ↔ IsValuationBasis b := by
  sorry

theorem IsValuationBasis.rescale_iff (b : Module.Basis ι K V) (w : ι → Kˣ) :
    IsValuationBasis (b.unitsSMul w) ↔ IsValuationBasis b := by
  sorry

/-- A sheared basis of the sup-norm plane fails the valuation-basis equality
when the shear parameter has norm strictly between zero and one (README RD.0.47). -/
theorem valuationBasis_bad_change (π : K) (hπ0 : 0 < ‖π‖) (hπ1 : ‖π‖ < 1)
    (b : Module.Basis (Fin 2) K (Fin 2 → K)) (h0 : b 0 = ![1, 0]) (h1 : b 1 = ![1, π]) :
    ¬ IsValuationBasis b := by
  sorry

/-- Every basis with empty index set is a valuation basis of the zero space. -/
theorem valuationBasis_zero [IsEmpty ι] (b : Module.Basis ι K V) : IsValuationBasis b := by
  sorry

/-- The basis consisting of one nonzero vector in a line is a valuation basis. -/
theorem valuationBasis_singleton (b : Module.Basis Unit K V) : IsValuationBasis b := by
  sorry

/-- The Euclidean norm on the real plane fails the weighted-maximum condition. -/
theorem valuationBasis_archimedean :
    ¬ IsValuationBasis (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis := by
  sorry

end ValuationBasis

section Endpoints

variable {R : Type*} [CommRing R]

theorem polynomial_endpoints_kernel (f : Polynomial R) :
    (f.eval 0 = 0 ∧ f.eval 1 = 0) ↔
      (Polynomial.X * (Polynomial.X - 1) : Polynomial R) ∣ f := by
  sorry

theorem polynomial_endpoints_surjective (x y : R) :
    ∃ f : Polynomial R, f.eval 0 = x ∧ f.eval 1 = y :=
  ⟨Polynomial.C x + (Polynomial.C y - Polynomial.C x) * Polynomial.X, by simp, by simp⟩

end Endpoints

section Denominators

theorem padic_integral_denominator_bound (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ‖((n + 1 : ℚ_[p])⁻¹)‖ ≤ (n + 1 : ℝ) := by
  sorry

end Denominators

end RD0

/-! ## Layer RD.1: Differential modules, radii and Frobenius slopes -/

noncomputable section

section Semilinear

variable {K V W : Type*} [Field K] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W] {σ : K →+* K}

/-- The equivariance condition on a coefficient-linear morphism between
Frobenius modules. Scalar multiples of such morphisms
commute with Frobenius only for scalars fixed by σ. -/
def FrobeniusEquivariant (φ : V →ₛₗ[σ] V) (ψ : W →ₛₗ[σ] W)
    (f : V →ₗ[K] W) : Prop :=
  ∀ v, f (φ v) = ψ (f v)

/-- The identity is Frobenius-equivariant. -/
example (φ : V →ₛₗ[σ] V) : FrobeniusEquivariant φ φ LinearMap.id := by
  intro v
  rfl

/-- Multiplication by a coefficient fixed by σ respects equivariance. -/
theorem frobeniusEquivariant_smul (φ : V →ₛₗ[σ] V) (ψ : W →ₛₗ[σ] W)
    (f : V →ₗ[K] W) (hf : FrobeniusEquivariant φ ψ f)
    (a : K) (ha : σ a = a) : FrobeniusEquivariant φ ψ (a • f) := by
  intro v
  simp [LinearMap.smul_apply, hf v, ha]

/-- Conjugation-semilinear Frobenius does not commute with multiplication by i. -/
example : ¬ FrobeniusEquivariant
    (starLinearEquiv ℂ : ℂ ≃ₗ⋆[ℂ] ℂ).toLinearMap
    (starLinearEquiv ℂ : ℂ ≃ₗ⋆[ℂ] ℂ).toLinearMap
    (Complex.I • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) := by
  intro h
  have h1 := h 1
  have him := congrArg Complex.im h1
  norm_num at him

end Semilinear

end

namespace RD1

/-- Successive conversion of a uniformiser slope to p-normalisation and then q-normalisation
is division by the product of the absolute ramification index and the exponent in q = p^a. -/
theorem slope_uniformiser_to_q (s e a : ℚ) : s / e / a = s / (e * a) := by
  rw [div_div]

noncomputable section

open scoped BigOperators

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The explicit finite Katz candidate. Its body uses only pinned carriers. -/
def katzCandidate (D : V → V) (e : ℕ → V) (n : ℕ) (x : K) : V :=
  ∑ j ∈ Finset.range n,
    (x ^ j / (Nat.factorial j : K)) •
      ∑ k ∈ Finset.range (j + 1),
        (((-1 : K) ^ k) * (Nat.choose j k : K)) • (D^[k]) (e (j - k))

/-- Cyclicity of `v` for an operator `D`: the iterates `v, D v, …, D^{n-1} v` form a basis. -/
def CyclicFor (D : V → V) (n : ℕ) (v : V) : Prop :=
  ∃ b : Module.Basis (Fin n) K V, ∀ i, b i = (D^[i.val]) v

/-- The zero operator on a rank-two space has no cyclic vector. -/
example (v : Fin 2 → ℚ) : ¬ CyclicFor (K := ℚ) (fun _ => 0) 2 v := by
  rintro ⟨b, hb⟩
  have h : b (1 : Fin 2) = 0 := by simpa using hb (1 : Fin 2)
  exact b.ne_zero (1 : Fin 2) h

/-- The empty basis gives cyclicity in rank zero. -/
example : CyclicFor (K := ℚ) (V := Fin 0 → ℚ) (fun _ => 0) 0 0 := by
  refine ⟨Pi.basisFun ℚ (Fin 0), ?_⟩
  intro i
  exact Fin.elim0 i

/-- Naturality of Katz's candidate under linear maps intertwining the operators. -/
theorem katzCandidate_naturality {W : Type*} [AddCommGroup W] [Module K W]
    (D : V → V) (E : W → W) (f : V →ₗ[K] W) (e : ℕ → V)
    (n : ℕ) (x : K) (h : ∀ v, f (D v) = E (f v)) :
    f (katzCandidate D e n x) = katzCandidate E (fun i => f (e i)) n x := by
  sorry

/-- The rank-zero Katz candidate is the zero vector. -/
theorem katzCandidate_zero_rank (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 0 x = 0 := by
  simp [katzCandidate]

/-- In rank one, the candidate is the first basis vector for every parameter. -/
theorem katzCandidate_rank_one (D : V → V) (e : ℕ → V) (x : K) :
    katzCandidate D e 1 x = e 0 := by
  simp [katzCandidate]

/-- A horizontal pair gives the positive-sign candidate `e₀ + x e₁`. -/
theorem katzCandidate_horizontal_two (D : V → V) (e : ℕ → V) (x : K)
    (h0 : D (e 0) = 0) : katzCandidate D e 2 x = e 0 + x • e 1 := by
  simp [katzCandidate, Finset.sum_range_succ, h0]

section CharacteristicZero

variable [CharZero K] [Algebra ℚ K] [Module ℚ V] [IsScalarTower ℚ K V]

/-- Katz's cyclic-vector theorem over a characteristic-zero differential field.
The D operator is rational-linear and satisfies the connection Leibniz rule. -/
theorem katz_cyclic_vector
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (n : ℕ) (hn : 0 < n) (b : Module.Basis (Fin n) K V)
    (e : ℕ → V) (he : ∀ i : Fin n, e i.val = b i)
    (t : K) (ht : δ t = 1) :
    ∃ a : ℚ, CyclicFor (K := K) D n (katzCandidate D e n (t - algebraMap ℚ K a)) := by
  sorry

/-- Cyclicity is preserved when a nonzero field derivation is normalised.
This is an end comparison, not a chain developing differential-module theory. -/
theorem cyclic_rescaling
    (δ : Derivation ℚ K K) (D : V →ₗ[ℚ] V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v)
    (s : K) (hs : s ≠ 0) (n : ℕ) (v : V) :
    CyclicFor (K := K) (fun w => s⁻¹ • D w) n v ↔ CyclicFor (K := K) D n v := by
  sorry

end CharacteristicZero

section RationalType

variable {F : Type*} [NormedField F] [IsUltrametricDist F] [CharZero F]

/-- Kedlaya–Xiao rational type (Definition 1.4.1), in an equivalent form: `∂u = 1` and
`‖∂ⁿx / n!‖ ≤ ‖u‖⁻ⁿ ‖x‖` for `n ≥ 1`. With `∂u = 1`, the case `n = 1` gives `‖∂‖ = ‖u‖⁻¹`. -/
def IsRationalType (D : Derivation ℚ F F) (u : F) : Prop :=
  D u = 1 ∧ ∀ n : ℕ, 1 ≤ n → ∀ x : F,
    ‖(D^[n] x) / (Nat.factorial n : F)‖ ≤ ‖u‖⁻¹ ^ n * ‖x‖

/-- Moving the parameter by a constant of no larger norm keeps rational type
(Kedlaya–Xiao, Remark 1.4.3). -/
theorem IsRationalType.add_const (D : Derivation ℚ F F) (u c : F)
    (h : IsRationalType D u) (hc : D c = 0) (hcu : ‖c‖ ≤ ‖u‖) :
    IsRationalType D (u + c) := by
  sorry

/-- Rational parameters differ exactly by constants of norm at most that of the first. -/
theorem IsRationalType.parameter_iff (D : Derivation ℚ F F) (u u' : F)
    (h : IsRationalType D u) :
    IsRationalType D u' ↔ D (u - u') = 0 ∧ ‖u - u'‖ ≤ ‖u‖ := by
  sorry

omit [IsUltrametricDist F] in
/-- The zero derivation has no rational parameter. -/
theorem zero_not_rationalType (u : F) : ¬ IsRationalType (0 : Derivation ℚ F F) u := by
  simp [IsRationalType]

end RationalType
end

end RD1

/-! ## Layer RD.2: Local monodromy and ramification -/

noncomputable section

section Monodromy

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The monodromy convention is Nφ = qφN. The Frobenius used here is linear,
as for the q-power action over a finite residue field. -/
def FrobeniusMonodromyRelation (q : K) (φ N : V →ₗ[K] V) : Prop :=
  N.comp φ = q • (φ.comp N)

/-- Zero monodromy is allowed for every Frobenius. -/
example (q : K) (φ : V →ₗ[K] V) : FrobeniusMonodromyRelation q φ 0 := by
  simp [FrobeniusMonodromyRelation]

/-- With identity Frobenius and q ≠ 1, the relation forces zero monodromy. -/
theorem monodromy_zero_of_identity (q : K) (hq : q ≠ 1) (N : V →ₗ[K] V)
    (h : FrobeniusMonodromyRelation q LinearMap.id N) : N = 0 := by
  unfold FrobeniusMonodromyRelation at h
  simp only [LinearMap.comp_id, LinearMap.id_comp] at h
  have h1 : (1 - q) • N = 0 := by rw [sub_smul, one_smul, ← h, sub_self]
  rcases smul_eq_zero.mp h1 with h2 | h2
  · exact absurd (sub_eq_zero.mp h2).symm hq
  · exact h2

/-- The logarithmic Frobenius relation implies nilpotence in finite dimension
when its scalar has complex absolute value greater than one. This is the
linear-algebra milestone underlying the nilpotence of the residue of a (φ,∇)-module. -/
theorem monodromy_nilpotent {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (q : ℂ) (hq : 1 < ‖q‖) (φ : V ≃ₗ[ℂ] V)
    (N : V →ₗ[ℂ] V) (h : FrobeniusMonodromyRelation q φ.toLinearMap N) :
    IsNilpotent N := by
  sorry

end Monodromy

end

namespace RD2

noncomputable section

/-- The completion of an algebraically closed nonarchimedean field is algebraically closed, in
every characteristic: Mathlib's `IsAlgClosed.of_denseRange` without its `CharZero` hypothesis.
The proof replaces Krasner's lemma by continuity of roots
(`Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`) and a Cauchy subsequence. -/
theorem isAlgClosed_of_denseRange {K L : Type*} [Field K] [NontriviallyNormedField L]
    [CompleteSpace L] [IsUltrametricDist L] [Algebra K L]
    (hi : DenseRange (algebraMap K L)) [IsAlgClosed K] : IsAlgClosed L := by
  sorry

/-- The tensor-product bound for c-constant Frobenius matrices over an ultrametric ring.
The entries of B are integral; the bound is written directly on A − 1 and B − 1. -/
theorem cconstant_kronecker {R : Type*} [NormedRing R] [IsUltrametricDist R]
    [NormOneClass R] {m n : Type*} [DecidableEq m] [DecidableEq n] {c : ℝ}
    {A : Matrix m m R} {B : Matrix n n R}
    (hA : ∀ i j, ‖(A - 1) i j‖ ≤ c) (hB : ∀ i j, ‖(B - 1) i j‖ ≤ c)
    (hB1 : ∀ i j, ‖B i j‖ ≤ 1) :
    ∀ i j, ‖(Matrix.kronecker A B - 1) i j‖ ≤ c := by
  sorry

/-- The exponent of Tsuzuki's key lemma exceeds one below the threshold. -/
theorem tsuzuki_exponent_gt_one (p c : ℝ) (hp : 1 < p) (hc0 : 0 < c)
    (hc : c < p ^ (-(1 / (p - 1)))) :
    1 < p * Real.log c / (Real.log c - Real.log p) := by
  sorry

/-- At the threshold `c = p^(−1/(p−1))` the exponent is exactly one, matching the sharpness of
the bound (Dwork's module is `p^(−1/(p−1))`-constant but not trivial). -/
theorem tsuzuki_exponent_eq_one (p : ℝ) (hp : 1 < p) :
    p * Real.log (p ^ (-(1 / (p - 1)))) /
      (Real.log (p ^ (-(1 / (p - 1)))) - Real.log p) = 1 := by
  sorry

/-- A nilpotent matrix is conjugate to each of its nonzero multiples. -/
theorem exists_conj_eq_smul_of_isNilpotent {K : Type*} [Field K] {n : Type*} [Fintype n]
    [DecidableEq n] (N : Matrix n n K) (hN : IsNilpotent N) (q : K) (hq : q ≠ 0) :
    ∃ P : GL n K, (P : Matrix n n K) * N * ((P⁻¹ : GL n K) : Matrix n n K) = q • N := by
  sorry

/-- The Kummer module `∇v = (1/m) v dt/t` has a Frobenius structure of order `h` as soon as
`m ∣ p^h − 1`; such an `h ≥ 1` exists when `p` and `m` are coprime. -/
theorem exists_dvd_pow_sub_one (p m : ℕ) (hm : 0 < m) (hpm : Nat.Coprime p m) :
    ∃ h, 0 < h ∧ m ∣ p ^ h - 1 := by
  sorry

/-- The Herbrand function of an Artin–Schreier extension with break `d`
(Kedlaya, overview, Example 2.1.10): `m` up to `d`, then `d + (m − d)/p`. -/
def artinSchreierHerbrand (p d m : ℝ) : ℝ :=
  if m ≤ d then m else d + (m - d) / p

/-- The inverse Herbrand argument at `β ≥ d` is `pβ − (p − 1)d`.
This numerical identity supplies the bound in RD.2.44(e); equality with a pullback's highest
break needs additional hypotheses. At β = d a nonzero Artin–Schreier character can become trivial. -/
theorem artinSchreierHerbrand_apply_inv (p d β : ℝ) (hp : 1 < p) (hβ : d ≤ β) :
    artinSchreierHerbrand p d (p * β - (p - 1) * d) = β := by
  sorry

/-- The two affine branches of the Herbrand profile meet at the break. -/
theorem artinSchreierHerbrand_at_break (p d : ℝ) : artinSchreierHerbrand p d d = d := by
  simp [artinSchreierHerbrand]

/-- A degree-`p` single-break ramification profile gives the Artin–Schreier formula for the
pinned Herbrand function, including its domain `[-1, ∞)` (README RD.2.44). -/
theorem artinSchreierHerbrand_eq_herbrand
    (K L : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L] (p d : ℕ) (hp : p.Prime) (hd : 0 < d)
    (hgroups : ∀ i : ℕ, Nat.card (TauCeti.LocalFieldsRamification.lowerRamificationGroup
      K L (i : ℤ)) = if i ≤ d then p else 1)
    (u : TauCeti.LocalFieldsRamification.RamificationIndexDomain) :
    artinSchreierHerbrand p d (u : ℝ) =
      (TauCeti.LocalFieldsRamification.herbrand K L u : ℝ) := by
  sorry

open PowerSeries in
/-- Horizontal homomorphisms into formal power series are constant and vanish on `range N`. -/
theorem horizontal_formal_solutions {K V : Type*} [Field K] [CharZero K] [AddCommGroup V]
    [Module K V] (N : V →ₗ[K] V) (hN : IsNilpotent N) (φ : V →ₗ[K] PowerSeries K)
    (h : ∀ v, φ (N v) = X * PowerSeries.derivative (R := K) (φ v)) :
    (∀ v, φ v = C (constantCoeff (φ v))) ∧ ∀ v, φ (N v) = 0 := by
  sorry

#check @TauCeti.GaloisDescent.span_invariants_eq_top
#check @TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant

#check @TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor

end

end RD2

/-! ## Layer RD.3: Frames, convergent and overconvergent coefficients -/

-- With Witt-vector coefficients and p-Frobenius, perfect-point fibres use this carrier.
-- The all-rank ordinary Witt equivalence in README RD.1.32 uses CrystallineCohomology CR.4.7
-- for cyclic blocks and classification; Mathlib supplies the carrier and rank-one theorem.
#check WittVector.Isocrystal


namespace RD3

open Filter Topology

noncomputable section

section Growth

variable {K : Type*} [NormedField K]

/-- The coefficients of a one-variable power series `∑ aₙ tⁿ` converging on the closed unit disc,
i.e. of an element of the Tate algebra `K⟨t⟩`: the norms tend to zero. These are the functions on
the tube `]A¹[` of the affine line in the frame `(A¹, P¹, P̂¹)`. -/
abbrev IsConvergentCoeffs (a : ℕ → K) : Prop :=
  PowerSeries.IsRestricted (1 : ℝ) (PowerSeries.mk a)

/-- The coefficients of an overconvergent power series, i.e. of an element of `K⟨t⟩†`: the series
converges on a disc of some radius `ρ > 1` (Berthelot 96-03 (2.1.2.2), (2.1.2.3)). These are the
global sections of `j†O` on the frame `(A¹, P¹, P̂¹)`. -/
def IsOverconvergentCoeffs (a : ℕ → K) : Prop :=
  ∃ ρ : ℝ, 1 < ρ ∧ PowerSeries.IsRestricted ρ (PowerSeries.mk a)

/-- Overconvergent series converge on the closed unit disc: `K⟨t⟩† ⊆ K⟨t⟩`. -/
theorem IsOverconvergentCoeffs.isConvergentCoeffs {a : ℕ → K} (h : IsOverconvergentCoeffs a) :
    IsConvergentCoeffs a := by
  obtain ⟨ρ, hρ, h⟩ := h
  change PowerSeries.IsRestricted (1 : ℝ) (PowerSeries.mk a)
  rw [PowerSeries.isRestricted_iff'] at h ⊢
  simp only [PowerSeries.coeff_mk, one_pow, mul_one] at h ⊢
  refine squeeze_zero (fun n => norm_nonneg _) (fun n => ?_) h
  calc ‖a n‖ = ‖a n‖ * 1 := (mul_one _).symm
    _ ≤ ‖a n‖ * ρ ^ n := mul_le_mul_of_nonneg_left (one_le_pow₀ hρ.le) (norm_nonneg _)

end Growth

section PadicGrowth

variable (p : ℕ) [Fact p.Prime]

/-- The coefficients p^⌊√n⌋ converge to zero without any geometric rate, separating
closed-disc coefficients from dagger coefficients (README RD.3.8). -/
theorem subgeometric_not_overconvergent : IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) ∧
    ¬ IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) := by
  sorry

/-- A `p`-adic Liouville-type exponent (README §RD.3.52): there is a non-integral
`a ∈ ℤ_p` for which `pⁿ / (n + a)` tends to zero but not geometrically. It produces the extension of
the unit object by the Kummer isocrystal `K_a` on `G_m` whose splitting is convergent but not
overconvergent (README §RD.3.53). One may take `a = -∑ p^{m_k}` with
`m₁ = 2` and `m_{k+1} = N_k - k`, `N_k = ∑_{j ≤ k} p^{m_j}`. -/
theorem exists_liouville_exponent :
    ∃ a : ℤ_[p], (∀ n : ℤ, (a : ℚ_[p]) ≠ n) ∧
      IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) ∧
      ¬ IsOverconvergentCoeffs
        (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) := by
  sorry

end PadicGrowth

section Taylor

variable {K M : Type*} [NormedField K] [CharZero K] [NormedAddCommGroup M] [NormedSpace K M]

/-- The one-variable convergence condition on a connection, written for the operator `θ = ∇_{d/dt}`
acting on a normed module of sections over a closed tube: for every section `e` and every `η < 1`,
the divided derivatives `θᵏ e / k!` decay faster than `η⁻ᵏ` (Berthelot 96-03 (2.2.14);
Guo–Reinecke, Definition 2.12). Characteristic zero ensures that all factorial denominators are nonzero. -/
def IsConvergentOperator (θ : M →ₗ[K] M) : Prop :=
  ∀ e : M, ∀ η : ℝ, 0 ≤ η → η < 1 →
    Tendsto (fun k : ℕ => ‖((k.factorial : K)⁻¹) • (θ ^ k) e‖ * η ^ k) atTop (𝓝 0)

/-- Degenerate case: the trivial connection (`θ = 0`) is convergent. -/
example : IsConvergentOperator (0 : M →ₗ[K] M) := by
  intro e η _ _
  refine tendsto_const_nhds.congr' ?_
  filter_upwards [eventually_ge_atTop 1] with k hk
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  simp [pow_succ]

end Taylor

section PadicTaylor

variable (p : ℕ) [Fact p.Prime]

/-- The identity operator over ℚ_p fails the Taylor convergence condition,
as the exponential has radius p^(−1/(p−1)) < 1 (README RD.3.33). -/
theorem exponential_not_convergent : ¬ IsConvergentOperator (LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p]) := by
  sorry

/-- The scalar Taylor operator converges up to the Dwork exponential radius; for `p = 2`
the scalar `2` attains the boundary, whereas the identity fails convergence. -/
theorem small_scalar_convergent (a : ℚ_[p])
    (ha : ‖a‖ ≤ (p : ℝ) ^ (-(1 / ((p : ℝ) - 1)))) :
    IsConvergentOperator (a • (LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p])) := by
  sorry

end PadicTaylor

section UnitRoot

open WittVector

variable (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]

/-- An isocrystal over a perfect field `k` (a perfect-point fibre with Witt-vector coefficients
and p-Frobenius) is
unit-root when, in some basis, the matrix of Frobenius has Witt-vector entries and invertible
determinant: Frobenius preserves a `W(k)`-lattice and is bijective on it. Over an algebraically
closed field this means that all slopes are zero (Étesse 2002, §5.1; Kedlaya, Notes, Definition 3.3). -/
def IsUnitRootIsocrystal (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Prop :=
  ∃ (n : ℕ) (b : Module.Basis (Fin n) (FractionRing (WittVector p k)) V)
    (A : Matrix (Fin n) (Fin n) (WittVector p k)),
    IsUnit A.det ∧
      ∀ j, Isocrystal.frobenius p k (V := V) (b j) =
        ∑ i, algebraMap (WittVector p k) (FractionRing (WittVector p k)) (A i j) • b i

/-- The standard slope-one Witt isocrystal has no Frobenius-stable lattice
on which Frobenius is bijective (README RD.3.47). -/
theorem slopeOne_not_unitRoot : ¬ IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 1) := by
  sorry

/-- The standard slope-zero isocrystal has the unit-root lattice `W(k)`. -/
theorem slopeZero_unitRoot : IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 0) := by
  sorry

#check WittVector.isocrystal_classification

/-- Rank one over an algebraically closed field: a one-dimensional isocrystal is unit-root exactly
when it is isomorphic to the standard isocrystal of slope `0`. -/
theorem isUnitRootIsocrystal_iff_of_finrank_eq_one (k : Type*) [Field k] [IsAlgClosed k] [CharP k p]
    (V : Type*) [AddCommGroup V] [Isocrystal p k V]
    (h : Module.finrank (FractionRing (WittVector p k)) V = 1) :
    IsUnitRootIsocrystal p k V ↔
      Nonempty (WittVector.IsocrystalEquiv p k (StandardOneDimIsocrystal p k 0) V) := by
  sorry

end UnitRoot

end

end RD3

/-! ## Layer RD.4: Rigid cohomology, supports and comparison maps -/

noncomputable section

section Twists

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- The linear Frobenius on V(n) is q^(-n)φ. The nonzero hypothesis on q belongs
to applications. This is only the coefficient-space part of the categorical Tate twist. -/
def TateTwistedFrobenius (q : K) (n : ℤ) (φ : V →ₗ[K] V) : V →ₗ[K] V :=
  q ^ (-n) • φ

/-- Twists add; nonzero q is necessary for negative integral exponents. -/
theorem tateTwistedFrobenius_add (q : K) (hq : q ≠ 0) (m n : ℤ)
    (φ : V →ₗ[K] V) :
    TateTwistedFrobenius q m (TateTwistedFrobenius q n φ) =
      TateTwistedFrobenius q (m + n) φ := by
  unfold TateTwistedFrobenius
  rw [smul_smul, ← zpow_add₀ hq, neg_add, add_comm]

/-- The weight-zero twist fixes the Frobenius operator. -/
example (q : K) (φ : V →ₗ[K] V) : TateTwistedFrobenius q 0 φ = φ := by
  simp [TateTwistedFrobenius]

/-- A Tate twist and its inverse cancel with the `q^(−n)` convention. -/
example (q : K) (hq : q ≠ 0) (φ : V →ₗ[K] V) :
    TateTwistedFrobenius q 1 (TateTwistedFrobenius q (-1) φ) = φ := by
  rw [tateTwistedFrobenius_add q hq]
  simp [TateTwistedFrobenius]

end Twists

end

-- Support sections and theta classes use the library kernel and range quotient.
#check LinearMap.ker
#check LinearMap.range
#check Submodule.mkQ
#check Submodule.liftQ

/-! ## Layer RD.5: Finiteness, descent, duality and semistable reduction -/

-- RD.5.41 uses algebraic cohomology functionals and Mathlib's continuous strong dual,
-- whose topology is uniform convergence on von Neumann bounded sets.
#check Module.Dual
#check StrongDual

-- The index of a linear map, additive under composition of maps with finite-dimensional
-- kernel and cokernel.
#check @LinearMap.index_comp


namespace RD5

noncomputable section

section Index

variable {K : Type*} [Field K]
variable {U V W : Type*} [AddCommGroup U] [Module K U] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W]

/-- A near-isomorphism (README §RD.5.23): kernel and cokernel are finite dimensional. Its index
`dim ker f − dim coker f` is Mathlib's `LinearMap.index`, which is additive under composition of
such maps (`LinearMap.index_comp`). -/
def NearIsomorphism (f : V →ₗ[K] W) : Prop :=
  FiniteDimensional K (LinearMap.ker f) ∧ FiniteDimensional K (W ⧸ LinearMap.range f)

/-- Near-isomorphisms are closed under composition. -/
theorem NearIsomorphism.comp (f : U →ₗ[K] V) (g : V →ₗ[K] W)
    (hf : NearIsomorphism f) (hg : NearIsomorphism g) : NearIsomorphism (g ∘ₗ f) := by
  sorry

/-- The square identity used for curves: if `b ∘ a = d ∘ c` and all four maps are
near-isomorphisms, then `ind a + ind b = ind c + ind d`. -/
theorem NearIsomorphism.index_square {X : Type*} [AddCommGroup X] [Module K X]
    (a : U →ₗ[K] V) (b : V →ₗ[K] X) (c : U →ₗ[K] W) (d : W →ₗ[K] X)
    (hsq : b ∘ₗ a = d ∘ₗ c) (ha : NearIsomorphism a) (hb : NearIsomorphism b)
    (hc : NearIsomorphism c) (hd : NearIsomorphism d) :
    a.index + b.index = c.index + d.index := by
  sorry

/-- A linear equivalence satisfies the near-isomorphism predicate in any dimension. -/
example (e : V ≃ₗ[K] W) : NearIsomorphism e.toLinearMap := by
  constructor
  · rw [LinearMap.ker_eq_bot.mpr e.injective]
    infer_instance
  · rw [LinearMap.range_eq_top.mpr e.surjective]
    infer_instance

/-- The zero endomorphism of the polynomial space has an infinite-dimensional kernel. -/
example : ¬ NearIsomorphism (0 : Polynomial K →ₗ[K] Polynomial K) := by
  intro h
  have hker := h.1
  rw [LinearMap.ker_zero] at hker
  have : Module.Finite K (⊤ : Submodule K (Polynomial K)) := hker
  have : Module.Finite K (Polynomial K) :=
    Module.Finite.equiv (Submodule.topEquiv : (⊤ : Submodule K (Polynomial K)) ≃ₗ[K] Polynomial K)
  exact (Polynomial.not_finite (R := K)) inferInstance

end Index

section Averaging

variable {K V W : Type*} [Field K] [CharZero K]
  [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]

/-- A positive constant degree makes the normalized trace a retraction and pullback followed
by normalized trace an idempotent, in ordinary or compact-support cohomology (RD.5.85). -/
theorem finiteEtale_averaging (d : ℕ) (hd : 0 < d)
    (u : V →ₗ[K] W) (tr : W →ₗ[K] V)
    (htr : tr ∘ₗ u = (d : K) • LinearMap.id) :
    (((d : K)⁻¹ • tr) ∘ₗ u = LinearMap.id) ∧
      (u ∘ₗ ((d : K)⁻¹ • tr)) ∘ₗ (u ∘ₗ ((d : K)⁻¹ • tr)) =
        u ∘ₗ ((d : K)⁻¹ • tr) := by
  have hdK : (d : K) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.ne_of_gt hd)
  have hpoint (v : V) : tr (u v) = (d : K) • v := by
    simpa using LinearMap.congr_fun htr v
  constructor
  · ext v
    simp [hpoint, smul_smul, hdK]
  · ext w
    simp [hpoint, smul_smul, hdK]

end Averaging

/-- `dim H¹_rig` of a smooth geometrically irreducible affine curve whose smooth
compactification has genus `g` and whose boundary has `d ≥ 1` geometric points.
For geometrically reduced boundary, this count equals its degree over the base field. -/
def affineCurveH1Dim (g d : ℕ) : ℕ := 2 * g + d - 1

/-- The index bookkeeping after a finite residue-field extension making the reduced boundary
geometrically reduced: `d` counts geometric punctures. The identities `ind ρ = 1 − g`,
`ind d_loc = −d`, `ind dρ = g − 1` and `H⁰ = K` give `1 − dim H¹ = (1 − g) + (−d) − (g − 1)`. -/
theorem affineCurve_index_identity (g d : ℕ) (hd : 1 ≤ d) :
    (1 : ℤ) - affineCurveH1Dim g d = (1 - g) + (-(d : ℤ)) - ((g : ℤ) - 1) := by
  sorry

/-- A projective line with `d ≥ 1` geometric punctures has first cohomology dimension `d−1`. -/
theorem affineCurveH1Dim_punctured_line (d : ℕ) (_hd : 1 ≤ d) :
    affineCurveH1Dim 0 d = d - 1 := by
  simp [affineCurveH1Dim]

/-- An elliptic curve with `d ≥ 1` geometric punctures has first cohomology dimension `d+1`. -/
theorem affineCurveH1Dim_punctured_elliptic (d : ℕ) (hd : 1 ≤ d) :
    affineCurveH1Dim 1 d = d + 1 := by
  dsimp [affineCurveH1Dim]
  omega

section Residues

/-- The residue `1/2` at a quadratic boundary point contributes `1` to the global
residue sum after the coefficient-field trace (README RD.5.24 and RD.5.46). -/
theorem boundary_residue_trace_constant {K L : Type*} [Field K] [CharZero K]
    [Field L] [Algebra K L] [FiniteDimensional K L] (hdegree : Module.finrank K L = 2) :
    Algebra.trace K L (algebraMap K L (1 / 2 : K)) - 1 = 0 := by
  rw [Algebra.trace_algebraMap, hdegree]
  norm_num

/-- The arithmetic residue criterion for a rank-one overconvergent log connection.
Convergence is a separate condition, which this rational predicate does not give. -/
def RankOneResidueUnipotent (a : ℚ) : Prop := ∃ n : ℤ, a = n

/-- Pulling back along `s ↦ s^m` multiplies the residue by `m`; for `a ∈ (1/m)ℤ` the pullback
is unipotent (semistable reduction of a Kummer isocrystal). -/
theorem rankOneResidueUnipotent_pullback (a : ℚ) (m : ℕ) (hm : 0 < m)
    (ha : ∃ n : ℤ, a = n / m) : RankOneResidueUnipotent (m * a) := by
  sorry

/-- Integral residues are removed by an integral power of the boundary parameter. -/
example (n : ℤ) : RankOneResidueUnipotent (n : ℚ) := ⟨n, rfl⟩

/-- The quadratic Kummer residue is not unipotent before the ramified pullback. -/
example : ¬ RankOneResidueUnipotent (1 / 2) := by
  rintro ⟨n, hn⟩
  have h := hn
  have : (2 : ℚ) * n = 1 := by linarith
  have hi : (2 : ℤ) * n = 1 := by exact_mod_cast this
  omega

variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
  [FiniteDimensional K V]

/-- A residue conjugate to `q` times itself, with `q ≥ 2`, is nilpotent. This is the
linear Frobenius special case; the semilinear case needs an isometric argument. -/
theorem isNilpotent_of_conj_eq_smul (q : ℕ) (hq : 2 ≤ q) (N : Module.End K V)
    (e : V ≃ₗ[K] V) (h : e.conj N = (q : K) • N) : IsNilpotent N := by
  sorry

end Residues

section DividedPowers

/-- At absolute ramification index `p - 1`, the uniformiser valuation of
`π^(p^r)/(p^r)!` is one. These divided powers are integral and bounded but do not
tend to zero (README RD.5.117). -/
theorem dividedPower_boundary_valuation (p : ℕ) [Fact p.Prime] (r : ℕ) :
    ((p ^ r : ℕ) : ℤ) - ((p - 1) * padicValNat p (p ^ r).factorial : ℕ) = 1 := by
  have hp : 1 < p := (Fact.out : p.Prime).one_lt
  have hdigits : (p.digits (p ^ r)).sum = 1 := by
    have h := Nat.digits_base_pow_mul (b := p) (k := r) (m := 1) hp (by decide)
    simp only [mul_one] at h
    rw [h, Nat.digits_of_lt p 1 (by decide) hp]
    simp
  have h := sub_one_mul_padicValNat_factorial (p := p) (p ^ r)
  rw [hdigits] at h
  have hpos : 0 < p ^ r := pow_pos (by omega) r
  omega

end DividedPowers

-- Bourbaki strictness, with the quotient topology, is Mathlib's notion.
#check Topology.IsStrictMap
#check LinearMap.isStrictMap_iff_isOpenQuotientMap_rangeRestrict
#check Topology.IsStrictMap.id

/-- The degree-`n` dimension of a tensor product of graded spaces with dimensions `a`, `b`. -/
def gradedTensorDim (a b : ℕ → ℕ) (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (n + 1), a i * b (n - i)

/-- The tensor dimensions of tori satisfy Vandermonde's identity in every degree. -/
theorem gradedTensorDim_torus (r s n : ℕ) :
    gradedTensorDim (Nat.choose r) (Nat.choose s) n = Nat.choose (r + s) n := by
  sorry

/-- Künneth gives two degree-one classes on the product of two multiplicative groups. -/
example : gradedTensorDim (Nat.choose 1) (Nat.choose 1) 1 = 2 := by
  decide

/-- Their two logarithmic classes give one degree-two class on that product. -/
example : gradedTensorDim (Nat.choose 1) (Nat.choose 1) 2 = 1 := by
  decide

end

end RD5

/-! ## Layer RD.6: Traces, conductors, Fourier transform and weights -/

noncomputable section

/-- Numerical purity after choosing a complex realisation of an eigenvalue. Applications require q > 1. This predicate includes no
algebraicity, integrality or assumption about other embeddings. -/
def HasIotaWeight (q w : ℝ) (α : ℂ) : Prop :=
  ‖α‖ = q ^ (w / 2)

/-- Purity at one embedding need not make the trace real. -/
example (q : ℝ) : HasIotaWeight q 0 Complex.I ∧ Complex.I.im ≠ 0 := by
  simp [HasIotaWeight]

/-- Zero is not pure of any real weight over q > 1. -/
theorem zero_not_pure (q w : ℝ) (hq : 1 < q) : ¬ HasIotaWeight q w 0 := by
  intro h
  unfold HasIotaWeight at h
  rw [norm_zero] at h
  exact (Real.rpow_pos_of_pos (by linarith) _).ne' h.symm

/-- Products add weights; q is positive so real powers multiply. -/
theorem iotaWeight_mul (q w₁ w₂ : ℝ) (hq : 1 < q) (α β : ℂ)
    (hα : HasIotaWeight q w₁ α) (hβ : HasIotaWeight q w₂ β) :
    HasIotaWeight q (w₁ + w₂) (α * β) := by
  unfold HasIotaWeight at *
  rw [norm_mul, hα, hβ, ← Real.rpow_add (by linarith)]
  ring_nf

/-- An integral Tate twist changes weight by -2n. There is no integer Tate twist
by an arbitrary real number. -/
theorem iotaWeight_tateTwist (q w : ℝ) (hq : 1 < q) (n : ℤ) (α : ℂ)
    (hα : HasIotaWeight q w α) :
    HasIotaWeight q (w - 2 * (n : ℝ)) ((q : ℂ) ^ (-n) * α) := by
  sorry

/-- Purity of all roots of a matrix characteristic polynomial at one complex
realisation. It imposes no reality condition on traces. -/
def HasPureSpectrum {ι : Type*} [Fintype ι] [DecidableEq ι]
    (q w : ℝ) (F : Matrix ι ι ℂ) : Prop :=
  ∀ α : ℂ, F.charpoly.IsRoot α → HasIotaWeight q w α

end

/-- A zero eigenvalue fails purity even at weight zero. -/
example : ¬ HasPureSpectrum 2 0 (0 : Matrix (Fin 1) (Fin 1) ℂ) := by
  intro h
  apply zero_not_pure 2 0 (by norm_num)
  exact h 0 (by simp [Polynomial.IsRoot, Matrix.charpoly_zero])

/-- The unit Frobenius has weight zero and fails a positive-weight test. -/
example : ¬ HasPureSpectrum 2 1 (1 : Matrix (Fin 1) (Fin 1) ℂ) := by
  intro h
  have h1 := h 1 (by simp [Polynomial.IsRoot, Matrix.charpoly_one])
  have hlt : (1 : ℝ) < 2 ^ (1 / 2 : ℝ) :=
    Real.one_lt_rpow (by norm_num) (by norm_num)
  have heq : (1 : ℝ) = 2 ^ (1 / 2 : ℝ) := by simpa [HasIotaWeight] using h1
  linarith

/-- The one-dimensional Tate Frobenius `q^(−n)` has weight `−2n`. -/
theorem tateLine_hasPureSpectrum (q : ℝ) (hq : 1 < q) (n : ℤ) :
    HasPureSpectrum q (-2 * (n : ℝ))
      ((q : ℂ) ^ (-n) • (1 : Matrix (Fin 1) (Fin 1) ℂ)) := by
  sorry

namespace RD6

noncomputable section

-- Dwork's character on the prime field and its pullback through the field trace.
#check AddChar.zmodChar
#check AddChar.zmodChar_apply
#check AddChar.compAddMonoidHom
#check AddChar.sum_eq_zero_of_ne_one

section Kummer

variable {F L K : Type*} [Field F] [Field L] [Algebra F L] [Field K]

/-- The Frobenius trace function of `K_a` at a point with residue field `L ⊇ F = 𝔽_q`:
`x ↦ χ(N_{L/F} x)`, for the multiplicative character `χ = χ_a`. -/
def kummerTraceFunction (χ : Fˣ →* Kˣ) (x : Lˣ) : K :=
  (χ (Units.map (Algebra.norm F : L →* F) x) : K)

/-- API: the trace function is multiplicative (`K_a` has rank one). -/
theorem kummerTraceFunction_mul (χ : Fˣ →* Kˣ) (x y : Lˣ) :
    kummerTraceFunction χ (x * y) = kummerTraceFunction χ x * kummerTraceFunction χ y := sorry

/-- API `kummerIsocrystal_tensor`: `K_a ⊗ K_{a'} = K_{a+a'}` on trace functions. -/
theorem kummerTraceFunction_mul_char (χ χ' : Fˣ →* Kˣ) (x : Lˣ) :
    kummerTraceFunction (χ * χ') x = kummerTraceFunction χ x * kummerTraceFunction χ' x := sorry

/-- Unit test `kummerIsocrystal_zero`: the trivial character gives the constant coefficient. -/
example (x : Lˣ) : kummerTraceFunction (1 : Fˣ →* Kˣ) x = 1 := by
  simp [kummerTraceFunction]

/-- Unit test: at a rational point (`L = F`) the trace is the character itself. -/
example (χ : Fˣ →* Kˣ) (x : Fˣ) : kummerTraceFunction (L := F) χ x = χ x := by
  simp [kummerTraceFunction, Algebra.norm_self]

end Kummer

section Kloosterman

variable {F K : Type*} [Field F] [Fintype F] [DecidableEq F] [CommRing K]

/-- The Kloosterman sum `Kl_{n+1}(z) = ∑_{x₁,…,xₙ ∈ Fˣ} ψ(x₁ + ⋯ + xₙ + z/(x₁⋯xₙ))`. The trace of
Frobenius of the Kloosterman F-isocrystal `Kl_{n+1}` at `z` is `(-1)^n` times this sum for
`ψ = ψ_π⁻¹`. -/
def kloostermanSum (ψ : AddChar F K) (n : ℕ) (z : Fˣ) : K :=
  ∑ x : Fin n → Fˣ, ψ ((∑ i, (x i : F)) + (z : F) * (((∏ i, x i)⁻¹ : Fˣ) : F))

/-- Unit test `kloostermanIsocrystal_degenerate`: `Kl_1(z) = ψ(z)`. -/
example (ψ : AddChar F K) (z : Fˣ) : kloostermanSum ψ 0 z = ψ z := by
  simp [kloostermanSum]

/-- Weil's bound, the consequence of purity of weight `1` of `Kl_2`. (Over the quadratic extension
the sums satisfy `Kl_2(z; q^2) = 2q - Kl_2(z; q)^2`, the eigenvalue relation of README
§RD.6.95.) -/
theorem kloostermanSum_one_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (z : Fˣ) :
    ‖kloostermanSum ψ 1 z‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

/-- Deligne's bound, the consequence of purity of weight `n` of the rank-`(n+1)` coefficient
`Kl_{n+1}` (README §RD.6.97 (d)). -/
theorem kloostermanSum_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (n : ℕ) (z : Fˣ) :
    ‖kloostermanSum ψ n z‖ ≤ (n + 1) * Real.sqrt (Fintype.card F) ^ n := sorry

end Kloosterman

/-- A power series rational over an extension field descends with a denominator of constant
coefficient `1`, so the rational function remains regular at zero (README RD.7.4(a);
Kronecker–Hankel, ClassicalArithmeticCompletion §6.44). -/
theorem rational_descent {k L : Type*} [Field k] [Field L] [Algebra k L] (f : PowerSeries k)
    (h : ∃ P Q : Polynomial L, Q.coeff 0 = 1 ∧
      (Q : PowerSeries L) * PowerSeries.map (algebraMap k L) f = (P : PowerSeries L)) :
    ∃ P Q : Polynomial k, Q.coeff 0 = 1 ∧ (Q : PowerSeries k) * f = (P : PowerSeries k) :=
  sorry

/-- The multiplier `θ = exp(π(x^q - x))` satisfies `θ' = π(q x^(q-1) - 1) θ`: this is the
horizontality of `F(σ^*e) = θ e` for the connection `∇e = π e dx` with `σ(x) = x^q`. The opposite
multiplier `exp(π(x - x^q))` (printed by Kedlaya and by Xu–Zhu) fails this identity. -/
theorem dwork_multiplier_horizontal {K : Type*} [Field K] [CharZero K] (π : K) (q : ℕ) (hq : 0 < q) :
    PowerSeries.derivative (R := K)
        ((PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X))) =
      PowerSeries.C π * (PowerSeries.C (q : K) * PowerSeries.X ^ (q - 1) - 1) *
        (PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X)) :=
  sorry

section Tannakian

open CategoryTheory MonoidalCategory

universe u

/-- The neutral Tannakian recognition theorem (Deligne–Milne Theorem 2.11): a `K`-linear abelian
rigid symmetric monoidal category with `End(𝟙) = K` and an exact faithful `K`-linear symmetric
monoidal functor to finite-dimensional vector spaces is equivalent to the finite-dimensional
comodules over a commutative Hopf algebra (Tau Ceti's `FGComoduleCat`, whose rigid and symmetric
structures are `TauCeti.FGComoduleCat.instRigidCategory` and `instSymmetricCategory`).
The README statement also asks that the equivalence be symmetric monoidal and carry `ω` to the
forgetful functor, and that a tensor generator give a Hopf algebra of finite type. -/
theorem neutralTannakian_recognition (K : Type u) [Field K]
    (C : Type (u + 1)) [Category.{u} C] [EssentiallySmall.{u} C] [Abelian C] [Linear K C]
    [MonoidalCategory C] [MonoidalPreadditive C] [MonoidalLinear K C] [SymmetricCategory C]
    [RigidCategory C]
    (hEnd : Function.Bijective (fun c : K => c • 𝟙 (𝟙_ C)))
    (ω : C ⥤ FGModuleCat K) [ω.Braided] [ω.Additive] [ω.Linear K] [ω.Faithful]
    [Limits.PreservesFiniteLimits ω] [Limits.PreservesFiniteColimits ω] :
    ∃ (H : Type u) (_ : CommRing H) (_ : HopfAlgebra K H),
      Nonempty (C ≌ TauCeti.FGComoduleCat.{u, u, u} K H) := sorry

end Tannakian

/-- A `d`-th root of a Frobenius eigenvalue of `ι`-weight `w` at a point of degree `d` has
absolute value `q^(w/2)`; twisting by the constant line it spans normalises the weight to `0`. -/
theorem weight_normalising_root {K : Type*} [Field K] (ι : K →+* ℂ) {q w : ℝ} (hq : 1 < q)
    {d : ℕ} (hd : 0 < d) {α c : K} (hc : c ^ d = α) (hα : ‖ι α‖ = q ^ (w * d / 2)) :
    ‖ι c‖ = q ^ (w / 2) := sorry

/-- The linear-algebra core of purity of middle cohomology: if a Frobenius-equivariant map goes
from a space whose eigenvalues have absolute value at most `r` to one whose eigenvalues have
absolute value at least `r`, every eigenvalue on its image has absolute value `r`. -/
theorem eigenvalue_norm_eq_on_image {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (FV : Module.End ℂ V) (FW : Module.End ℂ W) (f : V →ₗ[ℂ] W) (hf : f ∘ₗ FV = FW ∘ₗ f)
    (r : ℝ) (hV : ∀ μ, Module.End.HasEigenvalue FV μ → ‖μ‖ ≤ r)
    (hW : ∀ μ, Module.End.HasEigenvalue FW μ → r ≤ ‖μ‖)
    (μ : ℂ) (v : V) (hv : f v ≠ 0) (hμ : FW (f v) = μ • f v) : ‖μ‖ = r := sorry

end

end RD6

/-! ## Layer RD.7: Coefficient comparisons and Weil factors -/

noncomputable section

-- det(1 − T F): the convention for Weil factors.
#check Matrix.charpolyRev

/-- Factors of distinct pure weights have no common eigenvalue, so their ordinary
characteristic polynomials are coprime. This is the separation milestone, not
a claim of rational or integral coefficients. -/
theorem pure_charpolys_coprime {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (q w₁ w₂ : ℝ) (hq : 1 < q) (hw : w₁ ≠ w₂)
    (F : Matrix ι ι ℂ) (G : Matrix κ κ ℂ)
    (hF : HasPureSpectrum q w₁ F) (hG : HasPureSpectrum q w₂ G) :
    IsCoprime F.charpoly G.charpoly := by
  sorry

end

namespace RD7

open Polynomial

section WeightSeparation

/-- Local Fatou, proved here after Milne, Lemma 27.10: the coprime normalized numerator and
denominator of an `ℓ`-adically integral rational series have integral coefficients, including
the norm-one boundary (README RD.7.4(b)). DeligneWeightsAndPurity §4.4 supplies global extraction. -/
theorem fatou_local (ℓ : ℕ) [Fact ℓ.Prime] (f : PowerSeries ℤ_[ℓ])
    (hf : PowerSeries.constantCoeff f = 1) (G H : ℚ_[ℓ][X]) (hcop : IsCoprime G H)
    (hG : G.coeff 0 = 1) (hH : H.coeff 0 = 1)
    (h : (H : PowerSeries ℚ_[ℓ]) * PowerSeries.map (algebraMap ℤ_[ℓ] ℚ_[ℓ]) f =
      (G : PowerSeries ℚ_[ℓ])) :
    (∀ n, ‖G.coeff n‖ ≤ 1) ∧ ∀ n, ‖H.coeff n‖ ≤ 1 := by
  sorry

/-- The global Fatou specialization of DeligneWeightsAndPurity §4.4 gives a coprime
presentation `A/B`, with `A, B ∈ 1 + tℤ[t]`, for an integral power series with constant
term `1` that is rational over `ℚ` (README RD.7.4). -/
theorem fatou (f : PowerSeries ℤ) (hf : PowerSeries.constantCoeff f = 1) (A B : ℚ[X])
    (hB : B.coeff 0 ≠ 0)
    (h : (B : PowerSeries ℚ) * PowerSeries.map (Int.castRingHom ℚ) f = (A : PowerSeries ℚ)) :
    ∃ A' B' : ℤ[X], A'.coeff 0 = 1 ∧ B'.coeff 0 = 1 ∧
      IsCoprime (A'.map (Int.castRingHom ℚ)) (B'.map (Int.castRingHom ℚ)) ∧
      ((B'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) *
          PowerSeries.map (Int.castRingHom ℚ) f =
        ((A'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) := by
  sorry

/-- The complex-coefficient adapter constructs rational root partitions and their invertible
companion matrices over one `ℚ_ℓ`, then applies the Frobenius-module interface of
DeligneWeightsAndPurity §4.4 to provide integral factors (README RD.7.5): if
`∏ P_i^{(−1)^{i+1}} = A/B` with `A, B ∈ 1 + tℤ[t]` coprime, and every reciprocal
root of `P_i` (a root of its reverse) is a Weil `q`-number of weight `i` (all conjugates of
absolute value `q^{i/2}`; the inline condition is the Weil `q`-number of
DeligneWeightsAndPurity §0.1), then every `P_i` comes from a unique
polynomial in `1 + tℤ[t]`. -/
theorem weightSeparated_factor_extraction (q : ℕ) (hq : 1 < q) (N : ℕ)
    (A B : ℤ[X]) (hA : A.coeff 0 = 1) (hB : B.coeff 0 = 1)
    (hcop : IsCoprime (A.map (Int.castRingHom ℚ)) (B.map (Int.castRingHom ℚ)))
    (P : Fin (N + 1) → ℂ[X]) (hP0 : ∀ i, (P i).coeff 0 = 1)
    (hprod : (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Odd (i : ℕ)), P i) *
        B.map (Int.castRingHom ℂ) =
      (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Even (i : ℕ)), P i) *
        A.map (Int.castRingHom ℂ))
    (hpure : ∀ i, ∀ α ∈ (P i).reverse.roots, IsAlgebraic ℚ α ∧
      ∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (q : ℝ) ^ (((i : ℕ) : ℝ) / 2)) :
    ∃ Fac : Fin (N + 1) → ℤ[X], ∀ i, (Fac i).coeff 0 = 1 ∧
      (Fac i).map (Int.castRingHom ℂ) = P i := by
  sorry

/-- The three factors of P¹ have reciprocal roots of weights 0, 1 and 2,
with the middle factor having no roots. Every conjugate is included. -/
theorem p1_factor_purity (q : ℕ) (hq : 1 < q) :
    let P : Fin 3 → ℂ[X] := ![1 - X, 1, 1 - C (q : ℂ) * X]
    ∀ i, ∀ α ∈ (P i).reverse.roots, IsAlgebraic ℚ α ∧
      ∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (q : ℝ) ^ (((i : ℕ) : ℝ) / 2) := by
  classical
  dsimp only
  let P : Fin 3 → ℂ[X] := ![1 - X, 1, 1 - C (q : ℂ) * X]
  have hq0 : (q : ℂ) ≠ 0 := by exact_mod_cast (by omega : q ≠ 0)
  have hrev (a : ℂ) (ha : a ≠ 0) :
      (1 - C a * X).reverse = X - C a := by
    have hid : (1 - C a * X : ℂ[X]) = (-C a) * X + C 1 := by
      simp only [C_1]
      ring
    rw [hid, reverse_add_C]
    have hdeg : (-C a * X : ℂ[X]).natDegree = 1 := by
      simp [ha]
    rw [hdeg]
    rw [reverse_mul_X, reverse_neg, reverse_C, C_1, pow_one, one_mul]
    exact add_comm _ _
  have hconj (n : ℕ) (β : ℂ) (hβ : β ∈ (minpoly ℚ (n : ℂ)).aroots ℂ) : β = n := by
    have hm : minpoly ℚ (n : ℂ) = X - C (n : ℚ) := by
      simpa using minpoly.eq_X_sub_C_of_algebraMap_inj (n : ℚ)
        (algebraMap ℚ ℂ).injective
    rw [hm, Polynomial.aroots_X_sub_C] at hβ
    simpa using hβ
  intro i α hα
  fin_cases i
  · have hα1 : α = 1 := by
      change α ∈ (1 - X : ℂ[X]).reverse.roots at hα
      rw [show (1 - X : ℂ[X]) = 1 - C 1 * X by simp,
        hrev 1 one_ne_zero, Polynomial.roots_X_sub_C] at hα
      simpa using hα
    subst α
    refine ⟨by simpa using (isAlgebraic_natCast (R := ℚ) (A := ℂ) 1), ?_⟩
    intro β hβ
    rw [show β = 1 by simpa using hconj 1 β (by simpa using hβ)]
    simp
  · change α ∈ (C (1 : ℂ)).reverse.roots at hα
    rw [reverse_C, Polynomial.roots_C] at hα
    simp at hα
  · have hαq : α = q := by
      change α ∈ (1 - C (q : ℂ) * X).reverse.roots at hα
      rw [hrev (q : ℂ) hq0, Polynomial.roots_X_sub_C] at hα
      simpa using hα
    subst α
    refine ⟨isAlgebraic_natCast q, ?_⟩
    intro β hβ
    rw [hconj q β hβ]
    simp

end WeightSeparation

section Elliptic

variable {F : Type*} [Field F] [Finite F]

/-- The Weil factor `1 − a t + q t²` of a Weierstrass model over a finite field with `q`
elements, with `a = q + 1 − #W(F)` Tau Ceti's `frobeniusTrace`. For an elliptic model it is
`P_1(E, t)` of README §RD.7.17 (3). -/
noncomputable def ellipticWeilFactor (W : WeierstrassCurve F) : ℤ[X] :=
  1 - C W.frobeniusTrace * X + C (Nat.card F : ℤ) * X ^ 2

theorem ellipticWeilFactor_coeff_zero (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).coeff 0 = 1 := by
  sorry

theorem ellipticWeilFactor_natDegree (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).natDegree = 2 := by
  sorry

local instance : Fact (Nat.Prime 7) := ⟨by decide⟩

/-- The ordinary curve `y²=x³+x+1` over `𝔽₇` has trace three and the indicated Weil factor. -/
theorem ellipticWeilFactor_ordinary_seven :
    ellipticWeilFactor (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 7)) =
      1 - C 3 * X + C 7 * X ^ 2 := by
  sorry

end Elliptic

section DenominatorBounds

/-- The exponent `⌊log_p(2m + 1)⌋` for partial negative-power reduction to degree at most
`2g` in Kedlaya's Lemma 2 (README RD.7.13(a), RD.7.16(iv)). Full reduction to the
`2g` monomial classes also uses the factor `p ^ v_p(2g + 1)` of RD.7.13(c). -/
def kedlayaNegativeExponent (p m : ℕ) : ℕ := Nat.log p (2 * m + 1)

/-- The exponent `⌊log_p((2g + 1)(2m + 3))⌋` clearing the normalised positive-power
reduction and polynomial primitive for input degree at most `2g` (README §RD.7.13 (b)). -/
def kedlayaPositiveExponent (p g m : ℕ) : ℕ := Nat.log p ((2 * g + 1) * (2 * m + 3))

/-- The exponent `c = ⌊log_p(2g − 1)⌋` bounding the index of the crystalline lattice
(README §RD.7.15 (2); Edixhoven, Proposition 5.3.1). -/
def latticeDefectExponent (p g : ℕ) : ℕ := Nat.log p (2 * g - 1)

/-- Tuitman's reconstruction precision `max_{1 ≤ i ≤ g} (⌊log_p binom(4g, i) + ni/2⌋ + 1)`
(README §RD.7.19 (1); Tuitman, Proposition 4.2). This coefficient bound for the Weil polynomial
is independent of a cohomology basis; the Frobenius-coordinate bounds in parts (2)–(4) use
a basis of the integral image lattice specified in §RD.7.18. -/
noncomputable def tuitmanReconstructionPrecision (p g n : ℕ) : ℕ :=
  (Finset.Icc 1 g).sup fun i =>
    (⌊Real.logb p ((4 * g).choose i) + ((n * i : ℕ) : ℝ) / 2⌋).toNat + 1

/-- The negative-reduction exponent is the exact logarithmic denominator threshold. -/
theorem kedlayaNegativeExponent_spec (p m : ℕ) (hp : 1 < p) :
    p ^ kedlayaNegativeExponent p m ≤ 2 * m + 1 ∧
      2 * m + 1 < p ^ (kedlayaNegativeExponent p m + 1) := by
  sorry

/-- Increasing the negative pole order cannot lower the denominator budget. -/
theorem kedlayaNegativeExponent_mono (p : ℕ) (hp : 1 < p) :
    Monotone (kedlayaNegativeExponent p) := by
  sorry

/-- Negative reduction is integral exactly below its first prime threshold. -/
theorem kedlayaNegativeExponent_eq_zero_iff (p m : ℕ) (hp : 1 < p) :
    kedlayaNegativeExponent p m = 0 ↔ 2 * m + 1 < p := by
  sorry

/-- The positive-reduction exponent is the exact threshold for its larger degree bound. -/
theorem kedlayaPositiveExponent_spec (p g m : ℕ) (hp : 1 < p) :
    p ^ kedlayaPositiveExponent p g m ≤ (2 * g + 1) * (2 * m + 3) ∧
      (2 * g + 1) * (2 * m + 3) < p ^ (kedlayaPositiveExponent p g m + 1) := by
  sorry

/-- Increasing the positive pole order cannot lower the denominator budget. -/
theorem kedlayaPositiveExponent_mono (p g : ℕ) (hp : 1 < p) :
    Monotone (kedlayaPositiveExponent p g) := by
  sorry

/-- Positive reduction is integral exactly below its first prime threshold. -/
theorem kedlayaPositiveExponent_eq_zero_iff (p g m : ℕ) (hp : 1 < p) :
    kedlayaPositiveExponent p g m = 0 ↔ (2 * g + 1) * (2 * m + 3) < p := by
  sorry

/-- The lattice defect is bounded by the exact power-of-`p` interval containing `2g−1`. -/
theorem latticeDefectExponent_spec (p g : ℕ) (hp : 1 < p) (hg : 1 ≤ g) :
    p ^ latticeDefectExponent p g ≤ 2 * g - 1 ∧
      2 * g - 1 < p ^ (latticeDefectExponent p g + 1) := by
  sorry

/-- No lattice defect occurs exactly when `p > 2g−1`. -/
theorem latticeDefectExponent_eq_zero_iff (p g : ℕ) (hp : 1 < p) :
    latticeDefectExponent p g = 0 ↔ 2 * g - 1 < p := by
  sorry

/-- In genus one the monomial basis has no crystalline lattice defect. -/
theorem latticeDefectExponent_elliptic (p : ℕ) : latticeDefectExponent p 1 = 0 := by
  simp [latticeDefectExponent]

/-- Tuitman's precision exceeds every coefficient-size bound used for reconstruction. -/
theorem tuitmanReconstructionPrecision_spec (p g n : ℕ) (hp : 1 < p)
    (i : ℕ) (hi : i ∈ Finset.Icc 1 g) :
    (((4 * g).choose i : ℕ) : ℝ) * (p : ℝ) ^ (((n * i : ℕ) : ℝ) / 2) <
      (p : ℝ) ^ tuitmanReconstructionPrecision p g n := by
  sorry

/-- The genus-zero first cohomology has no coefficients requiring reconstruction. -/
theorem tuitmanReconstructionPrecision_genus_zero (p n : ℕ) :
    tuitmanReconstructionPrecision p 0 n = 0 := by
  simp [tuitmanReconstructionPrecision]

/-- Increasing the finite-field extension degree cannot reduce reconstruction precision. -/
theorem tuitmanReconstructionPrecision_mono (p g : ℕ) (hp : 1 < p) :
    Monotone (tuitmanReconstructionPrecision p g) := by
  sorry

end DenominatorBounds

end RD7

/-!
## Further API targets in the README

RD.1.3 specifies `katzCandidate_basis_coordinates` and `katzCandidate_jet` for the cyclic-vector development.
RD.2.25a specifies `IsCConstant.iff_galois` after the Fontaine–Katz equivalence.
RD.5.116 specifies `AbelianVariety.zarhin_dim` for the relative dimension and base-change API.
RD.1.48 specifies `IsRationalType.iff_spectralNorm`
for the operator-norm and spectral-norm comparisons.
RD.5.23 specifies `NearIsomorphism.of_bijective`, `NearIsomorphism.of_finiteDimensional`,
`NearIsomorphism.two_of_three`, `NearIsomorphism.of_square`,
`NearIsomorphism.linearEquiv_compat` and `NearIsomorphism.gm_derivative`.
The Robba derivative in the last target uses the analytic carriers of RD.0.

## Definitions stated only in the README

The following definitions and constructions of `README.md` need carriers that Mathlib and Tau Ceti
do not have at the pins (Robba and Amice rings, dagger algebras, differential and Frobenius modules,
frames and tubes, isocrystal categories, rigid cohomology and their relatives). They are README
targets with their intended signatures and are not declared here:
* Layer RD.0: §§0.1, 0.2, 0.3, 0.5, 0.6, 0.9, 0.17, 0.19, 0.34, 0.35, 0.36, 0.48, 0.50, 0.54.
* Layer RD.1: §§1.1, 1.2, 1.8, 1.11, 1.14, 1.17, 1.19, 1.22, 1.25, 1.26, 1.27, 1.35, 1.36, 1.43,
  1.55, 1.73.
* Layer RD.2: §§2.11, 2.12, 2.13, 2.14, 2.18, 2.24, 2.28, 2.34, 2.45, 2.49.
* Layer RD.3: §§3.1, 3.2, 3.3, 3.4, 3.13, 3.19, 3.22, 3.24, 3.25, 3.28, 3.34, 3.35, 3.37, 3.41,
  3.46, 3.51; §3.34a uses the general crystal carrier of CrystallineCohomology CR.1.2.
* Layer RD.4: §§4.1, 4.2, 4.5, 4.10, 4.11, 4.12, 4.15, 4.16, 4.17, 4.18, 4.36, 4.41, 4.42, 4.43,
  4.44, 4.45, 4.47, 4.49, 4.51, 4.58, 4.60 (shared fixed-weight form spaces and the Pan level adapter).
* Layer RD.5: §§5.12, 5.13, 5.14, 5.24, 5.50, 5.67, 5.68, 5.81, 5.82, 5.86, 5.87, 5.92, 5.93, 5.101,
  5.107, 5.110a, 5.110b (arbitrary-PD perfect coefficients and their convergent evaluation).
* Layer RD.6: §§6.1, 6.2, 6.3, 6.4, 6.6, 6.8, 6.11, 6.38, 6.40, 6.41, 6.42, 6.43, 6.45, 6.51, 6.57,
  6.58, 6.59, 6.69, 6.70.
* Layer RD.7: §§7.2, 7.18.
-/

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

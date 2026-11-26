import Mathlib

/-!
# Auxiliary algebra and analysis for theta lifts: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry` in
place of its proof. The overview of the README singles out seven results, one for each section, and
all of them can be stated on carriers that the pinned Mathlib already has:

* Amitsur's theorem (1.1), both parts: on `Matrix.charpoly` and `Submodule.span`.
* Multiplicative functions of finite modules that are trivial on projective modules (1.2): on
  `ModuleCat` over `MonoidAlgebra R Δ` and `CategoryTheory.ShortComplex.ShortExact`; the class `𝒞`
  and the function `φ` are arguments, `𝒞` with a hypothesis that characterises it.
* The weighted Combinatorial Nullstellensatz with multiplicity (1.3): on `MvPolynomial` and
  `MvPolynomial.vanishingIdeal`, with the cost of an exponent written out as a sum.
* Auerbach's lemma for a compact family of linear forms (2.1): on `Module.Dual` and `Module.Basis`.
* Gelfand's trick for `GL_n` over a valuation ring (2.2), all three parts: on `ValuationSubring`,
  `Matrix.GeneralLinearGroup` and `Representation`. The Hecke operators of (b) and (c) are written
  as sums over the cosets `gK` with chosen representatives (`Quotient.out`); in (c) the operator is
  an argument with a hypothesis that gives its value. The library's Hecke rings
  (`HeckeCosetModule`) ask that double cosets be finite unions of cosets, which a general valuation
  ring does not give, so they are not used here.
* The complex Gaussian integral for accretive matrices (3.1), both parts: with `(A + Aᴴ).PosDef`
  for "accretive" and Lebesgue measure on `n → ℂ`.
* Hua's bound for integrals of negative powers of determinants (3.2), both parts: as lower Lebesgue
  integrals over families of row vectors in `κ → ℂ`.
-/

namespace TauCetiRoadmap.ShortGRH.AuxiliaryAlgebraAndAnalysisForThetaLifts

open Matrix

/-- README §1.1 (a). Let `ρ : Λ → M_n(A)` be a homomorphism of `B`-algebras. If every coefficient of
the characteristic polynomial of `ρ w` lies in the image of `B`, then `det (ρ w)` is the image of
some `F : B`, and some `v : Λ` has `ρ v * ρ w = ρ w * ρ v = F • 1`. -/
theorem exists_mul_eq_smul_one_of_charpoly_coeff_mem {B A Λ n : Type*} [CommRing B]
    [CommRing A] [Algebra B A] [Ring Λ] [Algebra B Λ] [Fintype n] [DecidableEq n]
    (ρ : Λ →ₐ[B] Matrix n n A) (w : Λ)
    (hw : ∀ k : ℕ, (ρ w).charpoly.coeff k ∈ (algebraMap B A).range) :
    ∃ (v : Λ) (F : B), (ρ w).det = algebraMap B A F ∧ ρ v * ρ w = F • (1 : Matrix n n A) ∧
      ρ w * ρ v = F • (1 : Matrix n n A) := by
  sorry

/-- README §1.1 (b), Amitsur's theorem. Let `ρ : Λ → M_n(A)` be a homomorphism of `B`-algebras;
call `w : Λ` integral for `ρ` if every coefficient of `(ρ w).charpoly` lies in the image of
`B → A`. If a set `S` of elements integral for `ρ` spans `Λ` as a `B`-module, then every element
of `Λ` is integral for `ρ`. -/
theorem charpoly_coeff_mem_range_of_span_eq_top {B A Λ n : Type*} [CommRing B] [CommRing A]
    [Algebra B A] [Ring Λ] [Algebra B Λ] [Fintype n] [DecidableEq n]
    (ρ : Λ →ₐ[B] Matrix n n A) (S : Set Λ)
    (hS : ∀ s ∈ S, ∀ k : ℕ, (ρ s).charpoly.coeff k ∈ (algebraMap B A).range)
    (h_span : Submodule.span B S = ⊤) (w : Λ) (k : ℕ) :
    (ρ w).charpoly.coeff k ∈ (algebraMap B A).range := by
  sorry

/-- README §1.2. Let `Δ` be a finite group, `z` a central element, `ℓ` a prime and `R` a commutative
ring, and let `𝒞` be the class of the finite `R[Δ]`-modules killed by `ℓ` on which `z` fixes no
non-zero vector. Let `φ` be multiplicative in the short exact sequences whose middle term lies in
`𝒞`, and equal to `1` on the modules of `𝒞` that satisfy Higman's criterion (some additive `τ` has
`∑ g, g τ g⁻¹ = 1`). Then `φ = 1` on `𝒞`. -/
theorem eq_one_of_multiplicative_of_eq_one_of_higman {R Δ : Type} [CommRing R] [Group Δ]
    [Fintype Δ] (z : Δ) (hz : ∀ g : Δ, z * g = g * z) (ℓ : ℕ) (hℓ : ℓ.Prime)
    (𝒞 : ModuleCat.{0} (MonoidAlgebra R Δ) → Prop)
    (h𝒞 : ∀ M, 𝒞 M ↔ Finite M ∧ (∀ m : M, ℓ • m = 0) ∧
      ∀ m : M, MonoidAlgebra.of R Δ z • m = m → m = 0)
    (φ : ModuleCat.{0} (MonoidAlgebra R Δ) → ℚ≥0)
    (h_mul : ∀ S : CategoryTheory.ShortComplex (ModuleCat.{0} (MonoidAlgebra R Δ)),
      S.ShortExact → 𝒞 S.X₂ → φ S.X₂ = φ S.X₁ * φ S.X₃)
    (h_higman : ∀ P, 𝒞 P → (∃ τ : P →+ P, ∀ x : P,
      ∑ g : Δ, MonoidAlgebra.of R Δ g • τ (MonoidAlgebra.of R Δ g⁻¹ • x) = x) → φ P = 1)
    (M : ModuleCat.{0} (MonoidAlgebra R Δ)) (hM : 𝒞 M) : φ M = 1 := by
  sorry

/-- README §1.3, the weighted Combinatorial Nullstellensatz with multiplicity. For positive integers
`κ u`, the cost of an exponent `α` is `∑ u, α u / κ u`. Let `z t`, `t : T`, be pairwise distinct
points of `ι → K` with `#T ≥ ∏ u, κ u`, and for each `u` let `g u` be a polynomial all of whose
monomials have cost `< 1` and whose value at every `z t` is `z t u ^ κ u`. If `f ≠ 0` lies, for
every `t`, in the `d`-th power of the ideal of the polynomials that vanish at `z t`, then some
monomial with non-zero coefficient in `f` has cost `≥ d`. -/
theorem exists_mem_support_le_cost_of_mem_vanishingIdeal_pow {K ι T : Type*} [Field K]
    [Fintype ι] [Fintype T] (κ : ι → ℕ) (hκ : ∀ u, 0 < κ u) (z : T → ι → K)
    (hz : Function.Injective z) (hT : ∏ u, κ u ≤ Fintype.card T) (g : ι → MvPolynomial ι K)
    (hg_cost : ∀ u, ∀ α ∈ (g u).support, ∑ v, (α v : ℚ) / κ v < 1)
    (hg_eval : ∀ u t, MvPolynomial.eval (z t) (g u) = z t u ^ κ u) (d : ℕ)
    (f : MvPolynomial ι K) (hf : f ≠ 0)
    (hf_vanish : ∀ t, f ∈ MvPolynomial.vanishingIdeal K ({z t} : Set (ι → K)) ^ d) :
    ∃ α ∈ f.support, (d : ℚ) ≤ ∑ v, (α v : ℚ) / κ v := by
  sorry

/-- README §2.1, Auerbach's lemma for a compact family of linear forms. Let `U` be a vector space of
finite dimension `n` over the field `K`, and `ℓ` a family of linear forms on `U`, indexed by a
compact space `𝒜`, with no common zero other than `0`. Let `φ` be a ring homomorphism from `K` into
a normed field `L` for which every map `a ↦ φ (ℓ a v)` on `𝒜` is continuous. Then for some
`a j ∈ 𝒜` (`j < n`) and some basis `z` of `U`, `ℓ (a j) (z k)` is `1` for `j = k` and `0`
otherwise, and `‖φ (ℓ b (z k))‖ ≤ 1` for every `b ∈ 𝒜` and every `k`. -/
theorem exists_basis_dual_norm_le_one {K U 𝒜 L : Type*} [Field K] [AddCommGroup U] [Module K U]
    [FiniteDimensional K U] [TopologicalSpace 𝒜] [CompactSpace 𝒜] [NormedField L]
    (ℓ : 𝒜 → Module.Dual K U) (h_sep : ∀ v : U, (∀ a, ℓ a v = 0) → v = 0) (φ : K →+* L)
    (h_cont : ∀ v : U, Continuous fun a ↦ φ (ℓ a v)) :
    ∃ (a : Fin (Module.finrank K U) → 𝒜) (z : Module.Basis (Fin (Module.finrank K U)) K U),
      (∀ j k, ℓ (a j) (z k) = if j = k then 1 else 0) ∧ ∀ (b : 𝒜) (k), ‖φ (ℓ b (z k))‖ ≤ 1 := by
  sorry

/-- README §2.2 (a), Gelfand's condition for `GL_n` over a valuation ring. Let `O` be a valuation
ring of a field `F` and `K = GL_n(O)` the invertible matrices over `F` that have, with their
inverse, all entries in `O`. Then the transpose of every `g ∈ GL_n(F)` lies in `K g K`. -/
theorem exists_transpose_eq_mul_mul {F n : Type*} [Field F] [Fintype n] [DecidableEq n]
    (O : ValuationSubring F) (g : GL n F) :
    ∃ k k' : GL n F,
      (∀ i j, (k : Matrix n n F) i j ∈ O ∧ ((k⁻¹ : GL n F) : Matrix n n F) i j ∈ O) ∧
      (∀ i j, (k' : Matrix n n F) i j ∈ O ∧ ((k'⁻¹ : GL n F) : Matrix n n F) i j ∈ O) ∧
      (g : Matrix n n F)ᵀ = (k : Matrix n n F) * (g : Matrix n n F) * (k' : Matrix n n F) := by
  sorry

/-- README §2.2 (b), adjoints of Hecke operators. `K = GL_n(O)` is the image of `GL_n(O)` in
`GL_n(F)`; a Hecke function is a function on `GL_n(F)` that is invariant under `K` on both sides and
vanishes outside finitely many cosets `gK`; its operator sends `v` to the sum over the cosets `gK`
of `f g • π g v`, with chosen representatives. For a ring endomorphism `σ` and a pairing `β` that
is `σ`-semilinear in the first variable, linear in the second and invariant under `GL_n(F)`, the
function `g ↦ σ (f g⁻¹)` is again a Hecke function, and its operator is adjoint to that of `f` on
vectors fixed by `K`. -/
theorem heckeOperator_adjoint {F n A W W' Z : Type*} [Field F] [Fintype n] [DecidableEq n]
    [CommSemiring A] [AddCommMonoid W] [Module A W] [AddCommMonoid W'] [Module A W']
    [AddCommMonoid Z] [Module A Z] (O : ValuationSubring F) (K : Subgroup (GL n F))
    (hK : K = (Matrix.GeneralLinearGroup.map O.subtype).range)
    (π : Representation A (GL n F) W) (π' : Representation A (GL n F) W') (σ : A →+* A)
    (β : W →ₛₗ[σ] W' →ₗ[A] Z) (hβ : ∀ g x y, β (π g x) (π' g y) = β x y) (f : GL n F → A)
    (hf : ∀ g, ∀ k ∈ K, ∀ k' ∈ K, f (k * g * k') = f g)
    (hf_fin : (Function.support fun q : GL n F ⧸ K ↦ f q.out).Finite)
    {v : W} (hv : ∀ k ∈ K, π k v = v) {v' : W'} (hv' : ∀ k ∈ K, π' k v' = v') :
    (∀ g, ∀ k ∈ K, ∀ k' ∈ K, σ (f (k * g * k')⁻¹) = σ (f g⁻¹)) ∧
      (Function.support fun q : GL n F ⧸ K ↦ σ (f q.out⁻¹)).Finite ∧
      β (∑ᶠ q : GL n F ⧸ K, f q.out • π q.out v) v' =
        β v (∑ᶠ q : GL n F ⧸ K, σ (f q.out⁻¹) • π' q.out v') := by
  sorry

/-- README §2.2 (c), Gelfand's trick: the Hecke operators `T f` of `K = GL_n(O)`, for a valuation
ring `O` of `F`, commute on the vectors fixed by `K`. Hecke functions and their operators are as in
`heckeOperator_adjoint`. -/
theorem heckeOperator_comm {F n A W : Type*} [Field F] [Fintype n] [DecidableEq n]
    [CommSemiring A] [AddCommMonoid W] [Module A W] (O : ValuationSubring F)
    (K : Subgroup (GL n F)) (hK : K = (Matrix.GeneralLinearGroup.map O.subtype).range)
    (π : Representation A (GL n F) W) (T : (GL n F → A) → W → W)
    (hT : ∀ f v, T f v = ∑ᶠ q : GL n F ⧸ K, f q.out • π q.out v) (f f' : GL n F → A)
    (hf : ∀ g, ∀ k ∈ K, ∀ k' ∈ K, f (k * g * k') = f g)
    (hf_fin : (Function.support fun q : GL n F ⧸ K ↦ f q.out).Finite)
    (hf' : ∀ g, ∀ k ∈ K, ∀ k' ∈ K, f' (k * g * k') = f' g)
    (hf'_fin : (Function.support fun q : GL n F ⧸ K ↦ f' q.out).Finite)
    {v : W} (hv : ∀ k ∈ K, π k v = v) : T f (T f' v) = T f' (T f v) := by
  sorry

open scoped ComplexOrder in
/-- README §3.1 (a). An accretive complex matrix, one with `A + Aᴴ` positive definite, has non-zero
determinant. -/
theorem det_ne_zero_of_posDef_add_conjTranspose {n : Type*} [Fintype n] [DecidableEq n]
    {A : Matrix n n ℂ} (hA : (A + Aᴴ).PosDef) : A.det ≠ 0 := by
  sorry

open scoped ComplexOrder in
/-- README §3.1 (b), the complex Gaussian integral for an accretive matrix `A`: for every `a`, the
function `x ↦ exp (-x* A (x - a))` is integrable for Lebesgue measure on `n → ℂ`, and its integral
is `π ^ n (det A)⁻¹`. -/
theorem integrable_and_integral_cexp_neg_star_dotProduct_mulVec_sub {n : Type*} [Fintype n]
    [DecidableEq n] {A : Matrix n n ℂ} (hA : (A + Aᴴ).PosDef) (a : n → ℂ) :
    MeasureTheory.Integrable (fun x : n → ℂ ↦ Complex.exp (-(star x ⬝ᵥ (A *ᵥ (x - a))))) ∧
      ∫ x : n → ℂ, Complex.exp (-(star x ⬝ᵥ (A *ᵥ (x - a)))) =
        (Real.pi : ℂ) ^ Fintype.card n * A.det⁻¹ := by
  sorry

open scoped ComplexOrder in
/-- README §3.2 (a), Hua's bound with one factor for each integrated row. Write `k = #κ`. For a
finite index set `s`, shifts `a i ∈ κ → ℂ`, a positive definite `M ∈ M_k(ℂ)`, an invertible
`S ∈ M_k(ℂ)`, a real `γ ≥ 0` and an integer `r ≥ k`, the lower Lebesgue integral over the
families `y : s → κ → ℂ` of row vectors of
`γ ‖det (M + ∑ i, (y i S + a i)ᴴ (y i S + a i))‖⁻¹ ^ (#s + r)` is bounded by
`γ (π ^ k / (k! ‖det S‖ ^ 2)) ^ #s ‖det M‖⁻¹ ^ r`. -/
theorem lintegral_det_add_sum_vecMulVec_inv_pow_le {s κ : Type*} [Fintype s] [Fintype κ]
    [DecidableEq κ] {M S : Matrix κ κ ℂ} (hM : M.PosDef)
    (hS : S.det ≠ 0) {γ : ℝ} (hγ : 0 ≤ γ) {r : ℕ} (hr : Fintype.card κ ≤ r) (a : s → κ → ℂ) :
    ∫⁻ y : s → κ → ℂ, ENNReal.ofReal (γ *
        ‖(M + ∑ i, vecMulVec (star (y i ᵥ* S + a i)) (y i ᵥ* S + a i)).det‖⁻¹ ^
          (Fintype.card s + r)) ≤
      ENNReal.ofReal (γ * (Real.pi ^ Fintype.card κ /
        ((Fintype.card κ).factorial * ‖S.det‖ ^ 2)) ^ Fintype.card s * ‖M.det‖⁻¹ ^ r) := by
  sorry

open scoped ComplexOrder in
/-- README §3.2 (b), Hua's bound for a matrix variable. For finite sets `ι`, `κ` with `#κ ≥ 7`, a
positive definite `G ∈ M_κ(ℂ)`, an invertible `S ∈ M_ι(ℂ)`, a matrix `c ∈ M_{ι×κ}(ℂ)` and a real
`γ ≥ 0`, the lower Lebesgue integral over `X ∈ M_{ι×κ}(ℂ)` of
`γ ‖det (G + (S X + c)ᴴ (S X + c))‖⁻¹ ^ (#κ + #ι)` is bounded by
`γ ‖det S‖⁻¹ ^ (2 #κ) ‖det G‖⁻¹ ^ #κ`. -/
theorem lintegral_det_add_conjTranspose_mul_inv_pow_le {ι κ : Type*} [Fintype ι]
    [DecidableEq ι] [Fintype κ] [DecidableEq κ] (hκ : 7 ≤ Fintype.card κ) {G : Matrix κ κ ℂ}
    (hG : G.PosDef) {S : Matrix ι ι ℂ} (hS : S.det ≠ 0) (c : Matrix ι κ ℂ) {γ : ℝ}
    (hγ : 0 ≤ γ) :
    ∫⁻ X : ι → κ → ℂ, ENNReal.ofReal (γ *
        ‖(G + (S * Matrix.of X + c)ᴴ * (S * Matrix.of X + c)).det‖⁻¹ ^
          (Fintype.card κ + Fintype.card ι)) ≤
      ENNReal.ofReal (γ * ‖S.det‖⁻¹ ^ (2 * Fintype.card κ) * ‖G.det‖⁻¹ ^ Fintype.card κ) := by
  sorry

end TauCetiRoadmap.ShortGRH.AuxiliaryAlgebraAndAnalysisForThetaLifts

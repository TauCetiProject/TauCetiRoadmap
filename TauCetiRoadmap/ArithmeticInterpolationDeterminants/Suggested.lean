import Mathlib
import TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic

/-!
# Polynomial interpolation and arithmetic determinants: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry` and against
the pinned Mathlib and Tau Ceti, the roadmap's end theorems (`hermiteJet_bijective`,
`det_confluentVandermonde`, the Frobenius-graph nonvanishing test in its Hasse form
`exists_nonzero_hasse_jet_on_frobenius_graph` and its ordinary form
`exists_nonzero_ordinary_jet_on_frobenius_graph`, and `det_gram_matrix_smul`) and the main
statements of Layers 0, 1, 3 and 4 on which they and their consumers rest: the Frobenius
substitution identities for every power `q = p ^ e` of the characteristic (Layer 0), the kernel of
the unrestricted jet map (Layer 1), row ideals, the Gram change of family and ideal powers of
derivatives of products (Layer 3), and the row-dependent determinant bound for an arbitrary
absolute value and the evaluated derivative bound (Layer 4). It defines only the three objects
these statements need, `powerSubstitution`, `hermiteJet` and `confluentVandermonde`, all with real
bodies on native carriers. Every headline theorem of the roadmap is statable at the pins. Layer 2
has no statement here: the extended-ideal coordinate criterion is Tau Ceti's
(`Ideal.mem_map_algebraMap_iff` with `Module.Basis.mem_smul_top_iff`), and the transport of
minors along ring maps (README 2.1) takes a few lines from Mathlib's `RingHom.map_det` and Tau
Ceti's `Matrix.linearIndependent_row_iff_exists_det_submatrix_ne_zero`, so it is a README target
only. So are the unitriangular row changes of Layer 3 (README 3.2), a few lines from Tau Ceti's
`Matrix.det_submatrix_mul_left` and `Matrix.IsUpperUnitriangular.det_eq_one`. The norm statements
of Layer 5 are short consequences of Mathlib's `Algebra.norm_algebraMap`, the multiplicativity of
`Algebra.norm` and `Algebra.norm_eq_prod_embeddings`, and are README targets only.
-/

noncomputable section

open Polynomial Module
open scoped BigOperators NumberField

namespace TauCetiRoadmap.ArithmeticInterpolationDeterminants

/-! ## Layer 0: finite polynomial spaces, jets and the Frobenius substitution -/

section Substitution

variable {R : Type*} [CommRing R]

/-- The power substitution `Z ↦ X`, `W ↦ X ^ B` on `MvPolynomial (Fin 2) R`, with variable
`0 = Z` and variable `1 = W`: the native evaluation homomorphism `F ↦ F(X, X ^ B)`. -/
def powerSubstitution (B : ℕ) : MvPolynomial (Fin 2) R →ₐ[R] R[X] :=
  MvPolynomial.aeval (fun i => if i = 0 then X else X ^ B)

/-- The power substitution is injective on polynomials of `Z`-degree below `B` (README 0.3): the
coefficient of `X ^ (i + B j)` with `i < B` is the coefficient of `Z ^ i W ^ j`. Tau Ceti's
`MvPolynomial.injOn_aeval_X_pow` for the weight `(1, B)`. -/
theorem powerSubstitution_injOn (B : ℕ) (hB : 0 < B) :
    Set.InjOn (powerSubstitution (R := R) B)
      {f : MvPolynomial (Fin 2) R | f.degreeOf 0 < B} := by
  sorry

/-- In characteristic `p` and for `q = p ^ e` with `0 < e`, ordinary derivatives of every order
commute with the Frobenius substitution: `D ^ k (F(X, X ^ q)) = (∂_Z ^ k F)(X, X ^ q)`, since
`D (X ^ q) = q X ^ (q - 1) = 0` (README 0.4). At `e = 0` it fails: `D X = 1` while `∂_Z W = 0`. -/
theorem iterate_derivative_powerSubstitution {p : ℕ} [Fact p.Prime] [CharP R p]
    {e : ℕ} (he : 0 < e) (k : ℕ) (f : MvPolynomial (Fin 2) R) :
    (Polynomial.derivative^[k]) (powerSubstitution (p ^ e) f) =
      powerSubstitution (p ^ e) ((MvPolynomial.pderiv (0 : Fin 2))^[k] f) := by
  sorry

/-- In characteristic `p` and for `q = p ^ e`, Hasse derivatives of order `k < q` commute with
the Frobenius substitution: `D^[k] (F(X, X ^ q)) = (∂_Z^[k] F)(X, X ^ q)` (README 0.4;
Iwaniec–Kowalski, Lemma 11.17). The identity fails at `k = q`, witnessed by `F = W`; at `e = 0`
only `k = 0` is admitted and the identity is trivial. -/
theorem hasseDeriv_powerSubstitution {p : ℕ} [Fact p.Prime] [CharP R p]
    {e : ℕ} (k : ℕ) (hk : k < p ^ e) (f : MvPolynomial (Fin 2) R) :
    Polynomial.hasseDeriv k (powerSubstitution (p ^ e) f) =
      powerSubstitution (p ^ e) (MvPolynomial.hasseDeriv (Finsupp.single 0 k) f) := by
  sorry

end Substitution

section FrobeniusTest

variable {K : Type*} [Field K] {p : ℕ} [Fact p.Prime] [CharP K p]

/-- **The Frobenius-graph nonvanishing test, Hasse form** (README 0.6). For `q = p ^ e`, every
`e ≥ 0`, a nonzero bivariate `F` of `Z`-degree below `q` whose Frobenius substitution has degree
below `#S · (m + 1)`, with `m < q`, has a nonzero Hasse `Z`-jet of order at most `m` at some point
`(a, a ^ q)` with `a ∈ S`. Route: the root-count inequality over an arbitrary field for
`F(X, X ^ q)`, from Tau Ceti's `Polynomial.eval_hasseDeriv_rootMultiplicity_ne_zero` and Mathlib's
`Polynomial.card_roots'`, then the Hasse identity `hasseDeriv_powerSubstitution` at `k ≤ m < q`
(Iwaniec–Kowalski, Lemma 11.17, `k < q`). -/
theorem exists_nonzero_hasse_jet_on_frobenius_graph {e : ℕ}
    (F : MvPolynomial (Fin 2) K) (hF : F ≠ 0) (hZ : F.degreeOf 0 < p ^ e)
    (S : Finset K) (m : ℕ) (hm : m < p ^ e)
    (hdeg : (powerSubstitution (p ^ e) F).natDegree < S.card * (m + 1)) :
    ∃ a ∈ S, ∃ k ≤ m,
      MvPolynomial.eval ![a, a ^ p ^ e] (MvPolynomial.hasseDeriv (Finsupp.single 0 k) F) ≠ 0 := by
  sorry

/-- **The Frobenius-graph nonvanishing test, ordinary form** (README 0.6). For `q = p ^ e` with
`0 < e` and an order bound `m < p`, the same hypotheses give a nonzero ordinary `Z`-jet of order
at most `m` at some `(a, a ^ q)` with `a ∈ S`: the Hasse form applies since `m < p ≤ q`, and
`k!` is a unit for `k ≤ m < p`. At `e = 0` it fails (`F = W`, `S = {0}`, `m = 1` over
`ZMod 2`), and for `m ≥ p` it fails (`p = 2`, `e = 2`, `F = Z ^ 2`, `S = {0}`, `m = 2`: the
ordinary jets of orders `0, 1, 2` at `(0, 0)` are `0, 0, 2 = 0`). -/
theorem exists_nonzero_ordinary_jet_on_frobenius_graph {e : ℕ} (he : 0 < e)
    (F : MvPolynomial (Fin 2) K) (hF : F ≠ 0) (hZ : F.degreeOf 0 < p ^ e)
    (S : Finset K) (m : ℕ) (hm : m < p)
    (hdeg : (powerSubstitution (p ^ e) F).natDegree < S.card * (m + 1)) :
    ∃ a ∈ S, ∃ k ≤ m,
      MvPolynomial.eval ![a, a ^ p ^ e] ((MvPolynomial.pderiv (0 : Fin 2))^[k] F) ≠ 0 := by
  sorry

end FrobeniusTest

/-! ## Layer 1: Hermite interpolation and the confluent Vandermonde determinant -/

section Hermite

variable {K : Type*} [Field K] {r : ℕ}

/-- The Hermite jet map (README 1.1): on polynomials of degree below `M = ∑ i, m i`, the
`K`-linear map `f ↦ (fun i k => (hasseDeriv k f).eval (a i))` to `∀ i, Fin (m i) → K`, the
composite of the subtype inclusion, `Polynomial.hasseDeriv` and `Polynomial.leval`. -/
def hermiteJet (a : Fin r → K) (m : Fin r → ℕ) :
    Polynomial.degreeLT K (∑ i, m i) →ₗ[K] (∀ i, Fin (m i) → K) :=
  LinearMap.pi fun i => LinearMap.pi fun k =>
    Polynomial.leval (a i) ∘ₗ Polynomial.hasseDeriv (k : ℕ) ∘ₗ
      (Polynomial.degreeLT K (∑ i, m i)).subtype

/-- **Hermite interpolation** (README 1.1): for injective nodes the Hermite jet map on
polynomials of degree below `∑ i, m i` is bijective, for every multiplicity vector `m`, over
every field, in every characteristic (Iwaniec–Kowalski, Lemma 11.16). -/
theorem hermiteJet_bijective (a : Fin r → K) (ha : Function.Injective a)
    (m : Fin r → ℕ) : Function.Bijective (hermiteJet a m) := by
  sorry

/-- **The kernel of the unrestricted jet map** (README 1.2): all Hasse jets of `f` of order
`k < m i` vanish at the injective nodes `a i` iff `∏ i, (X − a i) ^ m i` divides `f`. This is the
kernel on all of `K[X]`, not on `degreeLT`. -/
theorem all_jets_vanish_iff_dvd (a : Fin r → K) (ha : Function.Injective a)
    (m : Fin r → ℕ) (f : K[X]) :
    (∀ i (k : Fin (m i)), (Polynomial.hasseDeriv (k : ℕ) f).eval (a i) = 0) ↔
      (∏ i, (X - C (a i)) ^ m i) ∣ f := by
  sorry

end Hermite

section Vandermonde

variable {R : Type*} [CommRing R] {r : ℕ}

/-- The Hasse confluent Vandermonde matrix (README 1.3): rows indexed by `Fin (∑ i, m i)` in the
lexicographic order `finSigmaFinEquiv ⟨i, k⟩` of the jets `(i, k)`, `k < m i`, columns by the
monomials `X ^ j` in increasing degree, entry `(hasseDeriv k (X ^ j)).eval (a i)`. -/
def confluentVandermonde (a : Fin r → R) (m : Fin r → ℕ) :
    Matrix (Fin (∑ i, m i)) (Fin (∑ i, m i)) R :=
  Matrix.of fun ρ j =>
    (Polynomial.hasseDeriv ((finSigmaFinEquiv.symm ρ).2 : ℕ) (X ^ (j : ℕ) : R[X])).eval
      (a (finSigmaFinEquiv.symm ρ).1)

/-- **The confluent Vandermonde determinant** (README 1.3): over every commutative ring,
`det (confluentVandermonde a m) = ∏_{i < j} (a j − a i) ^ (m i · m j)`, with the sign fixed by the
lexicographic row order; for `m = 1` this is Mathlib's `Matrix.det_vandermonde`. -/
theorem det_confluentVandermonde (a : Fin r → R) (m : Fin r → ℕ) :
    (confluentVandermonde a m).det =
      ∏ i : Fin r, ∏ j : Fin r, if i < j then (a j - a i) ^ (m i * m j) else 1 := by
  sorry

end Vandermonde

/-! ## Layer 3: ideal divisibility and changes of rows -/

section Divisibility

variable {R : Type*} [CommRing R]

/-- **Determinants in products of row ideals** (README 3.1): if every entry of row `i` lies in the
ideal `J i`, the determinant lies in `∏ i, J i`; the empty product is `⊤`. -/
theorem det_mem_prod_row_ideals {n : ℕ} (A : Matrix (Fin n) (Fin n) R)
    (J : Fin n → Ideal R) (h : ∀ i j, A i j ∈ J i) :
    A.det ∈ ∏ i, J i := by
  sorry

/-- **The Gram change-of-family identity** (README 3.3): for `w i = ∑ j, U i j • v j` in a real
inner product space, `Gram(w) = U Gram(v) Uᵀ`, hence `det Gram(w) = (det U) ^ 2 · det Gram(v)`,
with no independence or dimension hypothesis. -/
theorem det_gram_matrix_smul {ι E : Type*} [Fintype ι] [DecidableEq ι]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (U : Matrix ι ι ℝ) (v : ι → E) :
    (Matrix.gram ℝ (fun i => ∑ j, U i j • v j)).det =
      U.det ^ 2 * (Matrix.gram ℝ v).det := by
  sorry

/-- **Ordinary derivatives of a product in an ideal power** (README 3.4): if every ordinary
derivative of order `≤ K` of each of the `card ι` factors evaluates into `J` at `a`, every
derivative of order `≤ K` of the product with an arbitrary cofactor `g` evaluates into
`J ^ card ι`. No factorial is cancelled and `K` is unrestricted. -/
theorem derivative_prod_mem_ideal_pow {ι : Type*} [Fintype ι]
    (f : ι → R[X]) (g : R[X]) (a : R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K → ((Polynomial.derivative^[k]) (f i)).eval a ∈ J) :
    ∀ k, k ≤ K → ((Polynomial.derivative^[k]) (g * ∏ i, f i)).eval a ∈
      J ^ Fintype.card ι := by
  sorry

/-- **Hasse derivatives of a product in an ideal power** (README 3.4), with hypotheses on the
Hasse derivatives themselves; from Mathlib's Leibniz rule `Polynomial.hasseDeriv_mul`. -/
theorem hasseDeriv_prod_mem_ideal_pow {ι : Type*} [Fintype ι]
    (f : ι → R[X]) (g : R[X]) (a : R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K → (Polynomial.hasseDeriv k (f i)).eval a ∈ J) :
    ∀ k, k ≤ K → (Polynomial.hasseDeriv k (g * ∏ i, f i)).eval a ∈
      J ^ Fintype.card ι := by
  sorry

/-- **Partial derivatives of a product in an ideal power** (README 3.4): for polynomials in an
arbitrary set of variables `σ`, a variable `s` and a point `a : σ → R`, if every iterated partial
derivative `∂_s ^ k` of order `≤ K` of each of the `card ι` factors evaluates into `J` at `a`, so
does every such derivative of the product with an arbitrary cofactor, into `J ^ card ι`. The
bivariate `∂_Z` form is `σ = Fin 2`, `s = 0`. -/
theorem pderiv_prod_mem_ideal_pow {σ ι : Type*} [Fintype ι] (s : σ)
    (f : ι → MvPolynomial σ R) (g : MvPolynomial σ R)
    (a : σ → R) (J : Ideal R) (K : ℕ)
    (hf : ∀ i k, k ≤ K →
      MvPolynomial.eval a ((MvPolynomial.pderiv s)^[k] (f i)) ∈ J) :
    ∀ k, k ≤ K →
      MvPolynomial.eval a ((MvPolynomial.pderiv s)^[k] (g * ∏ i, f i)) ∈
        J ^ Fintype.card ι := by
  sorry

end Divisibility

/-! ## Layer 4: determinant size estimates -/

section Size

/-- **The row-dependent determinant bound** (README 4.1): for an absolute value `abv` on a
commutative ring with values in an ordered commutative ring, if the entries of row `i` have
absolute value at most `B i`, then `abv (det A) ≤ n! ∏ i, B i`; the row-dependent refinement of
Mathlib's uniform `Matrix.det_le`. The complex modulus and the modulus after a complex embedding
of a number field are instances. -/
theorem abv_det_le_factorial_prod {R S : Type*} [CommRing R] [CommRing S] [LinearOrder S]
    [IsStrictOrderedRing S] (abv : AbsoluteValue R S) {n : ℕ} (A : Matrix (Fin n) (Fin n) R)
    (B : Fin n → S) (hA : ∀ i j, abv (A i j) ≤ B i) :
    abv A.det ≤ (n.factorial : S) * ∏ i, B i := by
  sorry

/-- **The evaluated Hasse derivative bound** (README 4.3): for `natDegree f ≤ d`, coefficients of
modulus at most `H` and `‖a‖ ≤ A`, `‖D^[k] f (a)‖ ≤ H ∑_{j = k}^{d} choose j k · A ^ (j − k)`;
for `k > d` both sides are `0`. -/
theorem norm_hasseDeriv_eval_le (f : ℂ[X]) (d k : ℕ) (hd : f.natDegree ≤ d)
    (H A : ℝ) (hH : 0 ≤ H)
    (hcoeff : ∀ j, ‖f.coeff j‖ ≤ H) (a : ℂ) (ha : ‖a‖ ≤ A) :
    ‖(Polynomial.hasseDeriv k f).eval a‖ ≤
      H * ∑ j ∈ Finset.Icc k d, (Nat.choose j k : ℝ) * A ^ (j - k) := by
  sorry

end Size

end TauCetiRoadmap.ArithmeticInterpolationDeterminants

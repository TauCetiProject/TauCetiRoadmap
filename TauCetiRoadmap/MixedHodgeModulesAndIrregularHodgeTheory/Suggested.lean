import Mathlib

/-!
# Mixed Hodge modules, exponential mixed Hodge structures and the irregular Hodge filtration: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with
`sorry`, together with the few definitions their statements need.

## Stated here

* Layer 12, target 12.6, the Adolphson–Sperber theorem: for a Laurent polynomial `φ` in `n`
  variables whose Newton polytope `Δ(φ) = conv({0} ∪ supp φ)` is full dimensional and which is
  nondegenerate on every nonempty face of `Δ(φ)` not containing the origin, the twisted de Rham
  complex of the torus with differential `d + dφ ∧` is exact outside degree `n`, and its
  degree-`n` cohomology has dimension `n! · vol(Δ(φ))` (Adolphson–Sperber 1997, Theorem 4.13 and
  Theorem 5.1 with `r = 0` and `a = 0`; Theorem 4.1 is the cone-algebra form; Yu, Theorem 4.1).
  The algebraic de Rham complex of the torus is written in the basis `dlog x_J`, where it is the
  Koszul complex of the commuting operators
  `x_i ∂_i + x_i ∂_i φ` on the Laurent polynomial ring.

## Headline theorems not statable at the pins

Each of the following needs a carrier that neither Mathlib nor Tau Ceti has at the pins.

* Kashiwara's regular Riemann–Hilbert correspondence (Layer 1, target 1.5). Missing: algebraic
  `D`-modules on smooth complex varieties and their regular holonomic subcategory, and
  algebraically constructible and perverse sheaves on analytifications.
* Zucker's theorem on the `L²` cohomology of a polarized variation on a punctured curve
  (Layer 3, target 3.4). Missing: variations of Hodge structure and the weighted `L²` complexes
  of the Poincaré metric.
* Saito's structure theorems (Layers 4 and 5): strict-support decomposition and semisimplicity
  of polarizable pure Hodge modules, the polarized projective direct-image theorem (strictness,
  relative hard Lefschetz, purity of `H^j f_* M` of weight `w + j`), abelianness of `MHM(X)`
  with strictness for `W ∩ F`, and the weight bounds for `f_!` and `f_*`. Missing: filtered
  regular holonomic `D`-modules with the Kashiwara–Malgrange filtration, perverse sheaves on
  analytifications, and hence Hodge modules themselves.
* The structure of exponential mixed Hodge structures (Layer 6): the projector `Π` as reflector
  onto exponential mixed Hodge structures, the exponential tensor product, exponential weights
  and the exact faithful de Rham fibre. Missing: mixed Hodge modules on the affine line and
  additive convolution.
* `E₁`-degeneration of the irregular Hodge filtration and strictness of the bifiltered
  exponential realization (Esnault–Sabbah–Yu, Theorem 1.2.2; Fresán–Sabbah–Yu, Proposition A.10;
  Layer 7). Missing: the Deligne filtration, defined from the `F` and `V` filtrations of a mixed
  Hodge module, and polarized twistor `D`-modules.
* The classical `tg` criterion and its zero-locus formula (Fresán–Sabbah–Yu, Theorem A.24 and
  Example A.27; Layer 10), the Fourier costalk theorem and the Hodge numbers of the Fourier
  transform of a pure Hodge module (Theorem A.30, Corollary A.31; Layer 11), and the monodromy
  weights at infinity of `Π M` (Matsui–Takeuchi, Proposition A.3; Layer 11). Missing:
  exponential cohomology of a pair, which needs mixed Hodge modules and `Π`.
* Agreement of the Newton and irregular Hodge filtrations (Yu, Theorem 4.6), model independence
  of the logarithmic irregular Hodge filtration and the filtered Künneth and duality theorems
  (Chen–Yu, Theorem 1; Yu, Theorem 2.2) (Layer 12, targets 12.3, 12.7 and 12.9). Missing: the
  irregular Hodge filtration `F_irr` of a pair, defined through the Deligne filtration.
-/

namespace TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory

open MeasureTheory

/-! ## Layer 12: Logarithmic and Newton descriptions of the filtration -/

/-- The ring `ℂ[x₁^{±1}, …, x_n^{±1}]` of Laurent polynomials in `n` variables, the coordinate ring
of the torus `T = (G_m)^n`, realized as the additive monoid algebra of the character lattice
`ℤ^n`. -/
abbrev LaurentRing (n : ℕ) : Type := AddMonoidAlgebra ℂ (Fin n → ℤ)

/-- The Euler derivation `θ_i = x_i ∂/∂x_i` of the Laurent polynomial ring, which multiplies the
monomial `x^m` by `m_i`. -/
noncomputable def eulerDerivation {n : ℕ} (i : Fin n) : LaurentRing n →ₗ[ℂ] LaurentRing n :=
  (AddMonoidAlgebra.coeffLinearEquiv ℂ).symm.toLinearMap ∘ₗ
    Finsupp.lsum ℂ (fun m : Fin n → ℤ => ((m i : ℤ) : ℂ) • Finsupp.lsingle m) ∘ₗ
    (AddMonoidAlgebra.coeffLinearEquiv ℂ).toLinearMap

/-- The twisted Euler operator `θ_i + θ_i(φ)` of the exponential connection `d + dφ`: in the
basis `dlog x_i` of one-forms on the torus, `d + dφ ∧` applied to a function `g` has `i`-th
coefficient `θ_i g + θ_i(φ) g`. -/
noncomputable def twistedEuler {n : ℕ} (φ : LaurentRing n) (i : Fin n) :
    LaurentRing n →ₗ[ℂ] LaurentRing n :=
  eulerDerivation i + LinearMap.mulLeft ℂ (eulerDerivation i φ)

/-- The twisted de Rham differential `d + dφ ∧` on algebraic differential forms on the torus,
written in the basis `dlog x_J = dlog x_{j₁} ∧ ⋯ ∧ dlog x_{j_q}` (`j₁ < ⋯ < j_q`): a form is a
family `ω_J` of Laurent polynomials indexed by subsets `J`, and
`(dω)_J = Σ_{j ∈ J} (−1)^{#{i ∈ J | i < j}} (θ_j + θ_j(φ)) ω_{J ∖ {j}}`. -/
noncomputable def twistedDifferential {n : ℕ} (φ : LaurentRing n) :
    (Finset (Fin n) → LaurentRing n) →ₗ[ℂ] (Finset (Fin n) → LaurentRing n) :=
  LinearMap.pi fun J =>
    ∑ j ∈ J, ((-1 : ℂ) ^ (J.filter (· < j)).card) •
      (twistedEuler φ j ∘ₗ LinearMap.proj (J.erase j))

/-- The algebraic `q`-forms on the torus: the families `ω_J` supported on subsets of cardinality
`q`. -/
noncomputable def forms (n q : ℕ) : Submodule ℂ (Finset (Fin n) → LaurentRing n) :=
  ⨅ (J : Finset (Fin n)) (_ : J.card ≠ q), LinearMap.ker (LinearMap.proj J)

/-- The closed `q`-forms for the twisted differential `d + dφ ∧`. -/
noncomputable def cocycles {n : ℕ} (φ : LaurentRing n) (q : ℕ) :
    Submodule ℂ (Finset (Fin n) → LaurentRing n) :=
  forms n q ⊓ LinearMap.ker (twistedDifferential φ)

/-- The exact `q`-forms for the twisted differential `d + dφ ∧`: the images of the
`(q − 1)`-forms, and zero in degree `0`. -/
noncomputable def coboundaries {n : ℕ} (φ : LaurentRing n) (q : ℕ) :
    Submodule ℂ (Finset (Fin n) → LaurentRing n) :=
  ⨆ (p : ℕ) (_ : p + 1 = q), (forms n p).map (twistedDifferential φ)

/-- The top twisted de Rham cohomology `H^n_dR(T, E^φ)`: the quotient of the Laurent polynomial
ring, the coefficient of `dlog x₁ ∧ ⋯ ∧ dlog x_n`, by the sum of the images of the twisted Euler
operators. -/
abbrev topCohomology {n : ℕ} (φ : LaurentRing n) : Type :=
  LaurentRing n ⧸ ⨆ i : Fin n, LinearMap.range (twistedEuler φ i)

/-- The point of `ℝ^n` underlying a character `m ∈ ℤ^n`. -/
def latticePoint {n : ℕ} (m : Fin n → ℤ) : Fin n → ℝ := fun i => (m i : ℝ)

/-- The Newton polytope at the origin, `Δ(φ) = conv({0} ∪ supp φ) ⊂ ℝ^n`. -/
def newtonPolytope {n : ℕ} (φ : LaurentRing n) : Set (Fin n → ℝ) :=
  convexHull ℝ (insert 0 (latticePoint '' (φ.coeff.support : Set (Fin n → ℤ))))

open Classical in
/-- The Euler derivative `θ_j φ_σ` of the face polynomial `φ_σ = Σ_{m ∈ σ} a_m x^m` of `φ` along
a subset `σ` of `ℝ^n`, evaluated at a point `z ∈ ℂ^n`. -/
noncomputable def faceEulerEval {n : ℕ} (φ : LaurentRing n) (σ : Set (Fin n → ℝ)) (j : Fin n)
    (z : Fin n → ℂ) : ℂ :=
  ∑ m ∈ φ.coeff.support.filter (fun m => latticePoint m ∈ σ),
    ((m j : ℤ) : ℂ) * φ.coeff m * ∏ i, z i ^ m i

/-- Newton nondegeneracy (Kouchnirenko, Adolphson–Sperber): for every nonempty exposed face `σ`
of the Newton polytope `Δ(φ)` that does not contain the origin, the Euler derivatives
`θ_1 φ_σ, …, θ_n φ_σ` of the face polynomial have no common zero on the torus `(ℂˣ)^n`. The faces
of a polytope are exactly its exposed faces; the whole polytope, exposed by the zero functional,
contains the origin and is excluded. -/
def IsNewtonNondegenerate {n : ℕ} (φ : LaurentRing n) : Prop :=
  ∀ σ : Set (Fin n → ℝ), IsExposed ℝ (newtonPolytope φ) σ → σ.Nonempty → (0 : Fin n → ℝ) ∉ σ →
    ¬ ∃ z : Fin n → ℂ, (∀ i, z i ≠ 0) ∧ ∀ j, faceEulerEval φ σ j z = 0

/-- **Concentration and volume of twisted de Rham cohomology on a torus** (Adolphson–Sperber,
*On twisted de Rham cohomology*, Theorem 4.13 and Theorem 5.1 with `r = 0` and `a = 0`, Theorem 4.1
being the cone-algebra form; Yu, *Irregular Hodge filtration on twisted de Rham cohomology*,
Theorem 4.1). Let `φ` be a Laurent polynomial in `n` variables whose
Newton polytope `Δ(φ)` is full dimensional and which is Newton nondegenerate. Then the twisted de
Rham complex `(Ω^•(T), d + dφ ∧)` of the torus `T = (G_m)^n` is exact outside degree `n`, and
`H^n_dR(T, E^φ)` is finite dimensional of dimension `n! · vol(Δ(φ))`, the volume being Lebesgue
measure, for which a fundamental domain of `ℤ^n` has volume one. -/
theorem twistedDeRham_concentration_finrank {n : ℕ} (φ : LaurentRing n)
    (hfull : affineSpan ℝ (newtonPolytope φ) = ⊤) (hnd : IsNewtonNondegenerate φ) :
    (∀ r : ℕ, r ≠ n → cocycles φ r ≤ coboundaries φ r) ∧
      FiniteDimensional ℂ (topCohomology φ) ∧
      (Module.finrank ℂ (topCohomology φ) : ℝ) =
        (n.factorial : ℝ) * (volume (newtonPolytope φ)).toReal := by
  sorry

end TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory

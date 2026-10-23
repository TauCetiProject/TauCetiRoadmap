import Mathlib

/-!
# Local Galois deformation rings: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

Two headline results are stated on Mathlib carriers: the flat-domain, dimension and
regular-generic-fibre theorem for the completed rank-two odd-real quadric (1.14, 8.7),
and recovery of an ordered stable full flag from determinant-ordinary equations over
an arbitrary field (7.4). The quadric is the actual power-series quotient for the
universal matrix `[[a+X,b+Y],[c+Z,-a-X]]`. The flag theorem retains both the
characteristic-polynomial and ordered-product equations, in arbitrary rank.

The other headline statements require carriers absent at the pins. Layer F's
representability, trace-generation and condition/ideal theorems need the labelled
Artinian and complete local coefficient categories and their continuous deformation
functors and representing pairs. These are also needed for the local presentations
and tame complete-intersection and type-component theorems of Layers 1–2. The
Jacquet–Langlands and cycle-descent theorems (2.26.1–2.27) additionally need admissible
smooth representation classes, division-algebra types and deformation-cycle maps.

The period comparisons and type-quotient geometry of Layers 0 and 3 need coefficient
period rings, filtered modules with descent, and potentially semistable representation
predicates. The deformation comparisons with the imported block-centre and full-type
rings (3.7.1–3.8) need the GL₂ block, Montréal functor and type-ring carriers supplied
by PadicLocalLanglandsForGL2Qp. The finite-flat resolutions, Barsotti–Tate component
comparisons and endpoint ring theorems of Layers 4–5 need coefficient Fontaine–Laffaille
and Breuil–Kisin categories and their realizations and model schemes.

The ordinary component and eigenvalue-ring theorems of Layer 6, its GL₃ shape and
Serre-weight component labelling, and the comparison of determinant-ordinary and flag
components (7.6) need the ordinary incidence schemes and their image rings, Kisin
modules with tame descent, and the weak minimal patching functor. Apart from the
odd-real quadric, the selected-ring nonemptiness, geometry and completed-product
statements of Layer 8 need those deformation conditions and their universal quotients.
These results are omitted until their mathematical carriers can be used; elementary
matrix equations alone do not express their arithmetic hypotheses or conclusions.
-/

namespace TauCetiRoadmap.LocalGaloisDeformationRings

open scoped Matrix

/-- The completed odd-involution quadric at the residual coordinates of a real place. -/
noncomputable def oddRealIdeal {𝒪 : Type*} [CommRing 𝒪] (a b c : 𝒪) :
    Ideal (MvPowerSeries (Fin 3) 𝒪) :=
  Ideal.span {(MvPowerSeries.C a + MvPowerSeries.X 0) ^ 2 +
    (MvPowerSeries.C b + MvPowerSeries.X 1) *
      (MvPowerSeries.C c + MvPowerSeries.X 2) - 1}

/-- The rank-two odd real lifting ring, with its three translated matrix coordinates. -/
abbrev OddRealRing {𝒪 : Type*} [CommRing 𝒪] (a b c : 𝒪) :=
  MvPowerSeries (Fin 3) 𝒪 ⧸ oddRealIdeal a b c

/-- Geometry of the odd real lifting ring (README 1.14 and 8.7). -/
theorem oddRealRing_geometry {𝒪 : Type*} [CommRing 𝒪] [IsDomain 𝒪]
    [IsDiscreteValuationRing 𝒪] [CharZero 𝒪]
    [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪) 𝒪]
    (a b c ϖ : 𝒪) (hres : a ^ 2 + b * c - 1 ∈ IsLocalRing.maximalIdeal 𝒪)
    (hϖ : Irreducible ϖ) :
    IsDomain (OddRealRing a b c) ∧ Module.Flat 𝒪 (OddRealRing a b c) ∧
      ringKrullDim (OddRealRing a b c) = 3 ∧
      IsRegularRing (Localization.Away (algebraMap 𝒪 (OddRealRing a b c) ϖ)) ∧
      ringKrullDim (Localization.Away (algebraMap 𝒪 (OddRealRing a b c) ϖ)) = 2 := by
  sorry

section DeterminantOrdinary

variable {A G : Type*} [CommRing A] [Group G] {n : ℕ}

/-- The determinant-ordinary equations over their actual coefficient algebra:
characteristic polynomials and every ordered length-`n` product.
The extended universal coefficient ring and its descent image are separate README constructions. -/
def IsDetOrdinary (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  (∀ g, (ρ g : Matrix (Fin n) (Fin n) A).charpoly =
    ∏ i, (Polynomial.X - Polynomial.C ((χ i g : Aˣ) : A))) ∧
  ∀ g : Fin n → G,
    (List.ofFn fun i ↦ (ρ (g i) : Matrix (Fin n) (Fin n) A) -
      ((χ i (g i) : Aˣ) : A) • (1 : Matrix (Fin n) (Fin n) A)).prod = 0

/-- A simultaneous basis giving the prescribed ordered stable flag and its actual diagonal characters. -/
def HasOrderedTriangularization (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  ∃ B : GL (Fin n) A, ∀ g,
    (∀ i j : Fin n, j < i →
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i j = 0) ∧
    (∀ i : Fin n,
      ((B⁻¹ * ρ g * B : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) i i =
        ((χ i g : Aˣ) : A))

/-- The determinant-ordinary equations characterize the ordered stable full flag over any field
(README 7.4). Distinctness concerns character functions, without requiring a group element
on which all their values are distinct. -/
theorem det_ordinary_iff_ordered_triangularization {F : Type*} [Field F]
    (ρ : G →* GL (Fin n) F) (χ : Fin n → G →* Fˣ)
    (hχ : Function.Injective χ) :
    IsDetOrdinary ρ χ ↔ HasOrderedTriangularization ρ χ := by
  sorry

end DeterminantOrdinary

end TauCetiRoadmap.LocalGaloisDeformationRings

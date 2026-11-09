import Mathlib
import TauCeti.Algebra.Module.GradedModule.Internal

/-!
# Contact homology and the symplectic field theory formalism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, those headline theorems of the roadmap that are statable there: the
integer-graded orbit-algebra results of Layer 0. The free unital supercommutative algebra on an
internally graded ℚ-module is the explicit quotient of the native tensor algebra by the
Koszul swap relations on homogeneous generators. Its total-degree pieces form a grading. An
odd assignment on generators extends uniquely to an odd Leibniz map, and such a map squares
to zero exactly when it does so on generators.

The following headline theorems are not statable at the pins, and nothing is stated in their
place.

* Invariance of rational contact homology of a closed cooriented contact manifold (Layer 5), and
  its exact-cobordism maps and symmetric monoidal functor on homology (Layers 5–6). Mathlib has no
  contact structures, Reeb vector fields or symplectizations. Neither library has punctured
  pseudoholomorphic maps with Reeb asymptotics, their compactifications (Layers 1–4) or coherent
  virtual counts (Layer 5).
* The SFT master equations, the potential equation for cobordisms and the conditional sewing
  theorems (Layers 7–8). These need the same geometric counts.
* The nonexact receiving maps of Layer 9: the derived quantum Maurer–Cartan identity, the twisted
  Fock and contact differentials, and their composition laws. Each is stated for the actual
  no-positive-end count series. Stating the algebraic shadow for arbitrary series would not
  name the roadmap's objects.
-/

noncomputable section

namespace TauCetiRoadmap.SymplecticFieldTheory

universe v

/-- The homogeneous Koszul swap relation on the native tensor algebra of a graded ℚ-module:
for `x` of degree `p` and `y` of degree `q`, `x ⊗ y` is related to `(−1)^(pq) y ⊗ x`. -/
def signedSwapRel {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) (a b : TensorAlgebra ℚ V) : Prop :=
  ∃ (p q : ℤ) (x y : V),
    x ∈ G.piece p ∧ y ∈ G.piece q ∧
    a = TensorAlgebra.ι ℚ x * TensorAlgebra.ι ℚ y ∧
    b = ((p * q).negOnePow : ℤ) •
      (TensorAlgebra.ι ℚ y * TensorAlgebra.ι ℚ x)

/-- The free unital supercommutative algebra `A(V)`, as the explicit quotient of the tensor
algebra by the signed swap relation (not Mathlib's unsigned symmetric algebra). Over ℚ the
relation with `x = y` odd forces `x² = 0`. -/
abbrev SignedSym {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) :=
  RingQuot (signedSwapRel G)

/-- The generator map `V → A(V)`. -/
def generator {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) : V →ₗ[ℚ] SignedSym G :=
  (RingQuot.mkAlgHom ℚ (signedSwapRel G)).toLinearMap.comp (TensorAlgebra.ι ℚ)

/-- The degree-`p` piece of `A(V)`: the span of the images of the words
`x₁ ⊗ ⋯ ⊗ x_k` in homogeneous generators whose degrees sum to `p`. The empty word gives
`1` in degree `0`. -/
def signedSymPiece {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) (p : ℤ) : Submodule ℚ (SignedSym G) :=
  Submodule.span ℚ
    {a | ∃ l : List (Σ n : ℤ, G.piece n), (l.map Sigma.fst).sum = p ∧
      a = RingQuot.mkAlgHom ℚ (signedSwapRel G)
        (l.map fun x => TensorAlgebra.ι ℚ (x.2 : V)).prod}

/-- The total-degree pieces make `A(V)` an internally ℤ-graded algebra. The signed swap
relation is homogeneous, so the input-degree grading of the tensor algebra descends to the
quotient (Layer 0). -/
theorem nonempty_gradedAlgebra_signedSymPiece {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) :
    Nonempty (GradedAlgebra (signedSymPiece G)) := by
  sorry

/-- A degree-one linear assignment on generators extends uniquely to a linear map of
`A(V)` that satisfies the signed Leibniz rule `d(ab) = d a · b + (−1)^p a · d b` for `a` of
degree `p` (Layer 0). -/
theorem exists_unique_odd_extension {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) (δ : V →ₗ[ℚ] SignedSym G)
    (hδ : ∀ p x, x ∈ G.piece p → δ x ∈ signedSymPiece G (p + 1)) :
    ∃! d : SignedSym G →ₗ[ℚ] SignedSym G,
      d.comp (generator G) = δ ∧
      (∀ p a, a ∈ signedSymPiece G p → ∀ b,
        d (a * b) = d a * b + (p.negOnePow : ℤ) • (a * d b)) := by
  sorry

/-- A degree-one signed Leibniz map on `A(V)` squares to zero if and only if `d ∘ d`
vanishes on generators (Layer 0). The square of an odd derivation is an even derivation, so it
is determined by its values on generators. This reduces the geometric boundary identity to
a check on generators; it does not supply that identity. -/
theorem odd_square_zero_iff_generators {V : Type v} [AddCommGroup V] [Module ℚ V]
    (G : TauCeti.InternalGrading ℚ V) (d : SignedSym G →ₗ[ℚ] SignedSym G)
    (hdeg : ∀ p a, a ∈ signedSymPiece G p → d a ∈ signedSymPiece G (p + 1))
    (hLeibniz : ∀ p a, a ∈ signedSymPiece G p → ∀ b,
      d (a * b) = d a * b + (p.negOnePow : ℤ) • (a * d b)) :
    d.comp d = 0 ↔ ∀ x, d (d (generator G x)) = 0 := by
  sorry

end TauCetiRoadmap.SymplecticFieldTheory

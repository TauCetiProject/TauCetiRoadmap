import Mathlib

/-!
# Foams: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is README.md.
These statements test three algebraic headlines required by the foam construction. A completed
implementation must prove them using its actual constructions and also meet the README targets.

* Section 0.8 reconstructs the unique Frobenius coalgebra from a perfect trace.
* Section 2.8 constructs a homogeneous basis of an integral graded retract.
* Section 2.11 gives the integral circle algebra its prescribed rectangular Schur basis.

The last statement uses the dual Jacobi–Trudi determinant in elementary generators to specify
the Schur classes using Mathlib alone. Its matrix is indexed by the rectangle's columns, including
the empty matrix when a = N. Negative elementary indices give zero, not the constant coefficient.
The circle-state identification still requires the foam evaluation and state-space carriers.

The other headlines require carriers and operations constructed by the roadmap.
Evaluation polynomiality needs decorated closed prefoams, admissible colorings and their rational
evaluation (0.2–0.7, 1.1). Planar reconstruction needs the trace quotient and its splitting foams
(2.1–2.7). The concrete monoidal 2-categories and spatiality need closure-state 2-homs, composition
and chosen duality cells (Layers 3–5). Progressive spanning needs typed expressions and their
compiler (Layer 6). The canopolis requires disk categories and insertion (Layer 7).
KH1 needs KhovanovHomology K2's chosen graded Frobenius object, KH2 its circle tensors and the
nilvalent state functor, KH3 the compiler, and KH4 the formal surface category and disk action.
-/

namespace TauCetiRoadmap.Foams

/-- Section 0.8. A perfect trace on a finite free commutative algebra determines a unique
Frobenius coalgebra with that counit. Construct its comultiplication with a trace-dual basis
and prove independence of the basis. -/
theorem existsUnique_frobeniusCoalgebra
    (R A : Type*) [CommRing R] [CommRing A] [Algebra R A]
    [Module.Free R A] [Module.Finite R A]
    (ε : A →ₗ[R] R) (hε : ((LinearMap.mul R A).compr₂ ε).IsPerfPair) :
    ∃! c : Coalgebra R A, letI : Coalgebra R A := c
      Coalgebra.counit (R := R) (A := A) = ε ∧ Coalgebra.IsFrobenius R A := by
  sorry

/-- The equivariant coefficient ring Λ_N. The variable X i is e_(i+1). -/
def EquivariantRing (N : ℕ) : Type := MvPolynomial (Fin N) ℤ

namespace EquivariantRing

noncomputable instance (N : ℕ) : CommRing (EquivariantRing N) :=
  inferInstanceAs (CommRing (MvPolynomial (Fin N) ℤ))

noncomputable instance (N : ℕ) : Algebra ℤ (EquivariantRing N) :=
  inferInstanceAs (Algebra ℤ (MvPolynomial (Fin N) ℤ))

/-- The integral grading with e_(i+1) in degree 2(i+1). -/
def grading (N : ℕ) : ℤ → Submodule ℤ (EquivariantRing N) :=
  MvPolynomial.weightedHomogeneousSubmodule ℤ (fun i : Fin N => 2 * ((i : ℕ) + 1 : ℤ))

end EquivariantRing

/-- Section 2.8. The image of a degree-zero idempotent on a finite sum of shifted copies
of Λ_N has a finite homogeneous basis. The jth source summand has shift s j.
Reduce modulo the positive-degree ideal, lift an integral homogeneous basis, and use
bounded-below graded Nakayama on the resulting split map and its kernel. -/
theorem exists_homogeneous_basis_range_idempotent (N m : ℕ) (s : Fin m → ℤ)
    (p : (Fin m → EquivariantRing N) →ₗ[EquivariantRing N]
      (Fin m → EquivariantRing N))
    (hp : p.comp p = p)
    (hhom : ∀ (d : ℤ) (v : Fin m → EquivariantRing N),
      (∀ j, v j ∈ EquivariantRing.grading N (d - s j)) →
      ∀ j, p v j ∈ EquivariantRing.grading N (d - s j)) :
    ∃ (n : ℕ)
      (b : Module.Basis (Fin n) (EquivariantRing N) (LinearMap.range p))
      (d : Fin n → ℤ),
      ∀ i j, (b i).val j ∈ EquivariantRing.grading N (d i - s j) := by
  sorry

/-! The circle presentation and the few explicit polynomial definitions needed to state its basis. -/

/-- Elementary coefficients: x₀ = 1, xᵣ = x(r−1) for 1 ≤ r ≤ n, and zero otherwise. -/
def elementaryCoefficient {R : Type*} [CommRing R] {n : ℕ} (x : Fin n → R) (r : ℤ) : R :=
  if r = 0 then 1 else if h : 0 < r ∧ r ≤ n then x ⟨r.toNat - 1, by omega⟩ else 0

/-- The polynomial ring over Λ_N in the two families c₁,…,c_a and b₁,…,b_(N−a). -/
abbrev CirclePolynomial (N a : ℕ) :=
  MvPolynomial (Fin a ⊕ Fin (N - a)) (EquivariantRing N)

/-- The coefficients of c(t)b(t)−e(t) in positive degrees 1,…,N generate this ideal. -/
noncomputable def circleIdeal (N a : ℕ) : Ideal (CirclePolynomial N a) :=
  Ideal.span (Set.range fun r : Fin N =>
    (∑ i ∈ Finset.range (r.val + 2),
      elementaryCoefficient (fun j : Fin a => MvPolynomial.X (Sum.inl j)) (i : ℤ) *
      elementaryCoefficient (fun j : Fin (N - a) => MvPolynomial.X (Sum.inr j))
        ((r.val : ℤ) + 1 - i)) - MvPolynomial.C (MvPolynomial.X r))

/-- The integral equivariant circle algebra in its elementary-generator presentation. -/
abbrev CircleAlgebra (N a : ℕ) := CirclePolynomial N a ⧸ circleIdeal N a

/-- Young diagrams contained in the a by (N−a) rectangle. -/
abbrev RectanglePartition (N a : ℕ) :=
  {μ : YoungDiagram // ∀ p ∈ μ, p.1 < a ∧ p.2 < N - a}

/-- The dual Jacobi–Trudi polynomial det(c_(μ′ᵢ−i+j)), with N−a rows and columns.
Here `YoungDiagram.colLen i` is μ′ᵢ, and all subtractions occur in ℤ. -/
noncomputable def circleSchurPolynomial (N a : ℕ) (μ : YoungDiagram) :
    MvPolynomial (Fin a ⊕ Fin (N - a)) ℤ :=
  Matrix.det (fun i j : Fin (N - a) =>
    elementaryCoefficient (fun k : Fin a => MvPolynomial.X (Sum.inl k))
      ((μ.colLen i : ℤ) - (i : ℤ) + (j : ℤ)))

/-- Section 2.11. The explicit rectangular Schur classes form a basis of the integral circle
presentation. Their polynomial representatives have degree twice the number of boxes, and the
rectangle has binomial(N,a) shapes. Prove the integral presentation/basis theorem before comparing
these classes with evaluated circle states; no field extension is a hypothesis. -/
theorem exists_circle_schur_basis (N a : ℕ) (ha : a ≤ N) :
    Nat.card (RectanglePartition N a) = N.choose a ∧
      ∃ b : Module.Basis (RectanglePartition N a) (EquivariantRing N) (CircleAlgebra N a),
        (∀ μ, b μ = Ideal.Quotient.mk (circleIdeal N a)
          (MvPolynomial.map (Int.castRingHom (EquivariantRing N))
            (circleSchurPolynomial N a μ.val))) ∧
        ∀ μ : RectanglePartition N a,
          MvPolynomial.IsWeightedHomogeneous
            (Sum.elim (fun i : Fin a => 2 * ((i : ℕ) + 1))
              (fun j : Fin (N - a) => 2 * ((j : ℕ) + 1)))
            (circleSchurPolynomial N a μ.val) (2 * μ.val.card) := by
  sorry

end TauCetiRoadmap.Foams

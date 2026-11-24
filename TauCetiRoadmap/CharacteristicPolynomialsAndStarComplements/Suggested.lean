module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.CourantFischer

/-!
# Characteristic polynomials and star complements: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines
of the README that carry a Lean name, each with every conclusion the README attaches to it,
together with the definitions their statements need. The README's other targets (lemmas on a
proof route, forms of a headline and corollaries) are stated there in prose with their locators
or proof routes, and are not stated here.

The characteristic polynomial of a graph is `(G.adjMatrix R).charpoly` over a commutative ring
`R`, monic of degree `n = Fintype.card V`; its coefficient of `t^(n - j)` is written `a_j`. Spectra
are the multisets `adjSpectrum` and `lapSpectrum` of GraphSpectra, Layer 1, built on the sorted
eigenvalues of SpectralGraphBounds 1.1 and LaplacianEigenvaluesOfGraphs 1.1 (nonincreasing, index
`0` the largest). The matching polynomial lies in `ℤ[X]`, and the matching number in `ℕ∞`.

Results consumed from other roadmaps are not restated (README, Scope and ownership). The
definitions of other roadmaps that the statements need are verbatim local copies, each in a
section labelled with its owner and section: the sorted adjacency eigenvalues of
SpectralGraphBounds 1.1, the sorted Laplacian eigenvalues of LaplacianEigenvaluesOfGraphs 1.1,
the matching count and matching polynomial of MatchingPolynomial 1.1, the matching number of
MatchingTheory 1.1, the component count of TuttePolynomialAndArrangements 4.1, and from
GraphSpectra the spectra and two `DecidableRel` instances of Layer 1, the Hamming graphs and the
hypercube of 2.3, and the eigenspaces, main angles and walk counts of 3.9.
-/

@[expose] public section

noncomputable section

open SimpleGraph Matrix Polynomial Finset
open scoped Kronecker

namespace TauCetiRoadmap.CharacteristicPolynomialsAndStarComplements
/-! ## Local copy: SpectralGraphBounds, 1.1 -/

namespace SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end SpectralGraphBounds

/-! ## Local copy: LaplacianEigenvaluesOfGraphs, 1.1 -/

namespace LaplacianEigenvaluesOfGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.1 The Laplacian eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one and index `n - 1` the smallest. -/
def lapEigenvalues (G : _root_.SimpleGraph V) [DecidableRel G.Adj] :
    Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_lapMatrix ℝ).eigenvalues₀

end LaplacianEigenvaluesOfGraphs

/-! ## Local copy: MatchingPolynomial, 1.1 -/

namespace MatchingPolynomial

variable {V : Type*}

/-- 1.1 The number `m_k` of matchings of `G` with exactly `k` edges, a matching being a subgraph
`M` with `M.IsMatching`. On a finite vertex type the set is finite; `m_0 = 1` (the empty
subgraph). -/
noncomputable def matchingCount (G : SimpleGraph V) (k : ℕ) : ℕ :=
  {M : G.Subgraph | M.IsMatching ∧ M.edgeSet.ncard = k}.ncard

/-- 1.1 The matching polynomial `μ(G, x) = Σ_(0 ≤ k ≤ n/2) (−1)^k m_k x^(n − 2k)` of a graph on a
finite vertex type with `n` vertices. It is monic of degree `n`, and `μ = 1` on the empty type. -/
noncomputable def matchingPolynomial [Finite V] (G : SimpleGraph V) : ℤ[X] :=
  ∑ k ∈ Finset.range (Nat.card V / 2 + 1),
    C ((-1) ^ k * (matchingCount G k : ℤ)) * X ^ (Nat.card V - 2 * k)

end MatchingPolynomial

/-! ## Local copy: MatchingTheory, 1.1 -/

namespace MatchingTheory

variable {V : Type*}

/-- 1.1 The matching number `ν(G)`: the supremum in `ℕ∞` of the sizes of the matchings of `G`. -/
def matchingNumber (G : SimpleGraph V) : ℕ∞ :=
  ⨆ (M : G.Subgraph) (_ : M.IsMatching), M.edgeSet.encard

end MatchingTheory

/-! ## Local copy: TuttePolynomialAndArrangements, 4.1 -/

namespace TuttePolynomialAndArrangements

variable {V : Type*}

/-- 4.1 The number of connected components of the spanning subgraph of the complete vertex set
`V` with edge set `A`. -/
def numComponents (A : Set (Sym2 V)) : ℕ :=
  Nat.card (SimpleGraph.fromEdgeSet A).ConnectedComponent

end TuttePolynomialAndArrangements

open TauCetiRoadmap.CharacteristicPolynomialsAndStarComplements SpectralGraphBounds
  LaplacianEigenvaluesOfGraphs MatchingPolynomial MatchingTheory TuttePolynomialAndArrangements

/-! ## Interlacing predicates (README 4.1) -/

/-- The list `η₁ ≥ ⋯ ≥ η_m` interlaces `θ₁ ≥ ⋯ ≥ θ_n`: `m ≤ n` and `θ_i ≥ η_i ≥ θ_{n-m+i}`.
Indices are zero-based. (README 4.1) -/
def Interlaces {m n : ℕ} (η : Fin m → ℝ) (θ : Fin n → ℝ) : Prop :=
  m ≤ n ∧ ∀ (i : Fin m) (j : Fin n), (j : ℕ) = i → η i ≤ θ j ∧
    ∀ j' : Fin n, (j' : ℕ) = i + (n - m) → θ j' ≤ η i

/-- The interlacing is tight: for some `k ≤ m`, `η_i = θ_i` for `i < k` and `η_i = θ_{n-m+i}`
for `i ≥ k`. (README 4.1) -/
def IsTightInterlacing {m n : ℕ} (η : Fin m → ℝ) (θ : Fin n → ℝ) : Prop :=
  Interlaces η θ ∧ ∃ k ≤ m, ∀ (i : Fin m) (j : Fin n),
    ((i : ℕ) < k → (j : ℕ) = i → η i = θ j) ∧ (k ≤ i → (j : ℕ) = i + (n - m) → η i = θ j)

namespace SimpleGraph

/-! ## Local copy: GraphSpectra, Layer 1 (definitions and instances) -/

section GraphSpectraLayer1

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The adjacency spectrum, as a multiset of real numbers. -/
def adjSpectrum : Multiset ℝ := Multiset.map (adjEigenvalues G) Finset.univ.val

/-- The Laplacian spectrum, as a multiset of real numbers. -/
def lapSpectrum : Multiset ℝ := Multiset.map (lapEigenvalues G) Finset.univ.val

end GraphSpectraLayer1

instance {V W : Type*} : DecidableRel (completeBipartiteGraph V W).Adj := fun v w ↦
  inferInstanceAs (Decidable (v.isLeft ∧ w.isRight ∨ v.isRight ∧ w.isLeft))

instance {V W : Type*} (G : _root_.SimpleGraph V) [DecidableRel G.Adj]
    (H : _root_.SimpleGraph W) [DecidableRel H.Adj] : DecidableRel (G ⊕g H).Adj
  | Sum.inl x, Sum.inl y => inferInstanceAs (Decidable (G.Adj x y))
  | Sum.inr x, Sum.inr y => inferInstanceAs (Decidable (H.Adj x y))
  | Sum.inl _, Sum.inr _ => isFalse (by simp)
  | Sum.inr _, Sum.inl _ => isFalse (by simp)

/-! ## Local copy: GraphSpectra, 2.3 -/

/-- The Hamming graph `H(d, |Q|)`: words of length `d` over `Q`, adjacent when they differ in
exactly one coordinate. -/
def hammingGraph (d : ℕ) (Q : Type*) [DecidableEq Q] : _root_.SimpleGraph (Fin d → Q) where
  Adj x y := hammingDist x y = 1
  symm := ⟨fun x y h ↦ by rwa [hammingDist_comm]⟩
  loopless := ⟨fun x h ↦ by simp at h⟩

/-- The `d`-dimensional hypercube `Q_d = H(d, 2)`. -/
abbrev hypercube (d : ℕ) : _root_.SimpleGraph (Fin d → Bool) := hammingGraph d Bool

instance {d : ℕ} {Q : Type*} [DecidableEq Q] : DecidableRel (hammingGraph d Q).Adj :=
  fun _ _ ↦ inferInstanceAs (Decidable (hammingDist _ _ = 1))

/-! ## Local copy: GraphSpectra, 3.9 -/

section GraphSpectra39

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-- The eigenspace of `A` for `θ`, in Euclidean space. (README 3.9) -/
def adjEigenspace (θ : ℝ) : Submodule ℝ (EuclideanSpace ℝ V) :=
  Module.End.eigenspace (toEuclideanLin (G.adjMatrix ℝ)) θ

/-- The all-ones vector of Euclidean space. (README 3.9) -/
def onesVec : EuclideanSpace ℝ V := WithLp.toLp 2 fun _ ↦ 1

/-- The **main angle** `β_θ = ‖P_θ 𝟙‖ / √n`. (README 3.9) -/
def mainAngle (θ : ℝ) : ℝ :=
  ‖(G.adjEigenspace θ).starProjection onesVec‖ / √(Fintype.card V)

/-- The number `N_h = 𝟙ᵀ Aʰ 𝟙` of walks of length `h`. (README 3.9) -/
def walkCount (h : ℕ) : ℕ := ∑ x, ∑ y, (G.finsetWalkLength h x y).card

end GraphSpectra39

variable {V W : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
  (G : _root_.SimpleGraph V) [DecidableRel G.Adj] (H : _root_.SimpleGraph W) [DecidableRel H.Adj]

/-! ## Layer 1: the characteristic polynomial -/

section Layer1

/-! ### 1.1 Elementary edge sets -/

/-- The number of edges of `F` containing `x`. (README 1.1) -/
def edgeDegree (F : Finset (Sym2 V)) (x : V) : ℕ :=
  #(F.filter fun e ↦ x ∈ e)

/-- The vertices covered by `F`. (README 1.1) -/
def edgeSupport (F : Finset (Sym2 V)) : Finset V :=
  univ.filter fun x ↦ 0 < edgeDegree F x

/-- An **elementary** edge set: a set of edges of `G` whose spanning graph has every nontrivial
component a single edge or a cycle. Equivalently, every vertex has degree at most `2` in `F`, and
the ends of an edge at a vertex of degree `1` have degree `1`. (README 1.1) -/
def IsElementary (F : Finset (Sym2 V)) : Prop :=
  F ⊆ G.edgeFinset ∧ ∀ x, edgeDegree F x ≤ 2 ∧
    (edgeDegree F x = 1 → ∀ e ∈ F, x ∈ e → ∀ y ∈ e, edgeDegree F y = 1)

instance (F : Finset (Sym2 V)) : Decidable (G.IsElementary F) := by
  unfold IsElementary; infer_instance

/-- The number of nontrivial components of `(V, F)`: all components minus the isolated vertices.
(README 1.1) -/
def elemComponents (F : Finset (Sym2 V)) : ℕ :=
  numComponents (F : Set (Sym2 V)) - (Fintype.card V - #(edgeSupport F))

/-- The number of cycle components of an elementary edge set: the nontrivial components that are
not single edges. A single-edge component has two vertices and one edge, a cycle as many edges as
vertices. (README 1.1) -/
def elemCycles (F : Finset (Sym2 V)) : ℕ :=
  elemComponents F - (#(edgeSupport F) - #F)

/-- **Counting.** For an elementary set `F` with support `S`, `#F ≤ #S ≤ 2#F`, and the
`#S - #F` single-edge components are among the nontrivial ones. (README 1.1) -/
theorem IsElementary.card_le_card_edgeSupport {F : Finset (Sym2 V)} (hF : G.IsElementary F) :
    #F ≤ #(edgeSupport F) ∧ #(edgeSupport F) ≤ 2 * #F ∧
      #(edgeSupport F) - #F ≤ elemComponents F := by
  sorry

/-! ### 1.2 Harary's determinant formula and Sachs's coefficient theorem -/

/-- **Harary's determinant formula.** `det A = (-1)^n ∑ (-1)^{c(F)} 2^{z(F)}` over the spanning
elementary edge sets `F`. (README 1.2) -/
theorem det_adjMatrix (R : Type*) [CommRing R] :
    (G.adjMatrix R).det = (-1) ^ Fintype.card V *
      ∑ F ∈ G.edgeFinset.powerset with G.IsElementary F ∧ edgeSupport F = univ,
        ((-1) ^ elemComponents F * 2 ^ elemCycles F : R) := by
  sorry

/-- **Sachs's coefficient theorem.** For `j ≤ n`, the coefficient of `t^{n-j}` in `det(tI - A)` is
`∑ (-1)^{c(F)} 2^{z(F)}` over the elementary edge sets `F` covering `j` vertices. (README 1.2) -/
theorem coeff_charpoly_adjMatrix (R : Type*) [CommRing R] {j : ℕ} (hj : j ≤ Fintype.card V) :
    (G.adjMatrix R).charpoly.coeff (Fintype.card V - j) =
      ∑ F ∈ G.edgeFinset.powerset with G.IsElementary F ∧ #(edgeSupport F) = j,
        ((-1) ^ elemComponents F * 2 ^ elemCycles F : R) := by
  sorry

/-- **The first coefficients.** For `n ≥ 3`: `a₁ = 0`, `a₂ = -m` and `a₃ = -2t` with `t` the
number of triangles. (README 1.2) -/
theorem coeff_charpoly_adjMatrix_sub_one_two_three (R : Type*) [CommRing R]
    (hn : 3 ≤ Fintype.card V) :
    (G.adjMatrix R).charpoly.coeff (Fintype.card V - 1) = 0 ∧
      (G.adjMatrix R).charpoly.coeff (Fintype.card V - 2) = -(#G.edgeFinset : R) ∧
      (G.adjMatrix R).charpoly.coeff (Fintype.card V - 3) = -2 * (#(G.cliqueFinset 3) : R) := by
  sorry

/-! ### 1.3 Vertex deletion -/

/-- **An isolated vertex.** If `v` has degree `0`, `p_G = t p_{G-v}`. (README 1.3) -/
theorem charpoly_adjMatrix_of_degree_eq_zero (R : Type*) [CommRing R] {v : V}
    (hv : G.degree v = 0) :
    (G.adjMatrix R).charpoly = X * ((G.induce ({v}ᶜ : Set V)).adjMatrix R).charpoly := by
  sorry

end Layer1

/-! ## Layer 2: nullity and determinant of forests -/

section Layer2

/-- **The lowest term of the matching polynomial.** The least power of `t` in `μ(G)` is
`t^{n - 2ν}`, stated in `ℕ∞` without subtraction. (README 2.1) -/
theorem natTrailingDegree_matchingPolynomial :
    ((matchingPolynomial G).natTrailingDegree : ℕ∞) + 2 * matchingNumber G = Nat.card V := by
  sorry

/-- **Nullity of a forest.** For a forest, `0` has multiplicity `n - 2ν` in the adjacency
spectrum, stated in `ℕ∞` without subtraction. (README 2.2) -/
theorem IsAcyclic.count_zero_adjSpectrum (hG : G.IsAcyclic) :
    (G.adjSpectrum.count 0 : ℕ∞) + 2 * matchingNumber G = Fintype.card V := by
  sorry

open Classical in
/-- **The determinant of a forest.** It is `(-1)^{n/2}` if the forest has a perfect matching and
`0` otherwise. (README 2.2) -/
theorem IsAcyclic.det_adjMatrix (hG : G.IsAcyclic) :
    (G.adjMatrix ℤ).det =
      if ∃ M : G.Subgraph, M.IsPerfectMatching then (-1) ^ (Fintype.card V / 2) else 0 := by
  sorry

end Layer2

/-! ## Layer 3: graph operations, the complement and energy -/

section Layer3

/-! ### 3.1 Tensor products and joins -/

/-- The tensor (direct, categorical, Kronecker) product: `(x, y) ~ (x', y')` when `x ~ x'` and
`y ~ y'`. (README 3.1) -/
def tensorProd (G : _root_.SimpleGraph V) (H : _root_.SimpleGraph W) :
    _root_.SimpleGraph (V × W) where
  Adj p q := G.Adj p.1 q.1 ∧ H.Adj p.2 q.2
  symm := ⟨fun _ _ h ↦ ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun _ h ↦ G.loopless.irrefl _ h.1⟩

instance : DecidableRel (tensorProd G H).Adj :=
  fun p q ↦ inferInstanceAs (Decidable (G.Adj p.1 q.1 ∧ H.Adj p.2 q.2))

/-- Degrees multiply in the tensor product. (README 3.1) -/
theorem degree_tensorProd (p : V × W) :
    (tensorProd G H).degree p = G.degree p.1 * H.degree p.2 := by
  sorry

/-- Sanity check of the definition: over any commutative ring, `A(G × H) = A_G ⊗ A_H`.
(README 3.1) -/
theorem adjMatrix_tensorProd (R : Type*) [CommRing R] :
    (tensorProd G H).adjMatrix R = G.adjMatrix R ⊗ₖ H.adjMatrix R := by
  sorry

/-- **Spectrum of the tensor product:** the multiset of pairwise products. (README 3.1) -/
theorem adjSpectrum_tensorProd :
    (tensorProd G H).adjSpectrum = (G.adjSpectrum ×ˢ H.adjSpectrum).map (fun p ↦ p.1 * p.2) := by
  sorry

/-- The join: the disjoint union with every vertex of `G` joined to every vertex of `H`.
(README 3.1) -/
def join (G : _root_.SimpleGraph V) (H : _root_.SimpleGraph W) : _root_.SimpleGraph (V ⊕ W) :=
  (G ⊕g H) ⊔ completeBipartiteGraph V W

instance : DecidableRel (join G H).Adj := fun p q ↦ by
  unfold join; infer_instance

/-- **Laplacian spectrum of a join.** For `n₁, n₂ ≥ 1`: `0`, `n₁ + n₂`, and every Laplacian
eigenvalue of each side but one `0`, shifted by the order of the other side. (README 3.1) -/
theorem lapSpectrum_join [Nonempty V] [Nonempty W] :
    (join G H).lapSpectrum =
      0 ::ₘ ((Fintype.card V + Fintype.card W : ℕ) : ℝ) ::ₘ
        ((G.lapSpectrum.erase 0).map (fun ν : ℝ ↦ ν + Fintype.card W) +
          (H.lapSpectrum.erase 0).map (fun ν : ℝ ↦ ν + Fintype.card V)) := by
  sorry

/-! ### 3.2 Main angles and the complement -/

/-- **The complement polynomial.** Off the poles,
`p_{Ḡ}(t) = (-1)ⁿ p_G(-t-1) (1 - n ∑_θ β_θ² / (t + 1 + θ))`, the sum over the distinct
eigenvalues. (README 3.2) -/
theorem eval_charpoly_compl (t : ℝ) (ht : ∀ θ ∈ G.adjSpectrum, t + 1 + θ ≠ 0) :
    (Gᶜ.adjMatrix ℝ).charpoly.eval t =
      (-1) ^ Fintype.card V * (G.adjMatrix ℝ).charpoly.eval (-t - 1) *
        (1 - Fintype.card V * ∑ θ ∈ G.adjSpectrum.toFinset, G.mainAngle θ ^ 2 / (t + 1 + θ)) := by
  sorry

/-- **The walk generating function.** For `t ≠ 0` with `|tθ| < 1` on the spectrum,
`∑ N_h tʰ = t⁻¹ ((-1)ⁿ p_{Ḡ}(-(t+1)/t) / p_G(1/t) - 1)`. (README 3.2) -/
theorem hasSum_walkCount_mul_pow {t : ℝ} (ht : t ≠ 0) (hρ : ∀ θ ∈ G.adjSpectrum, |t * θ| < 1) :
    HasSum (fun h ↦ (G.walkCount h : ℝ) * t ^ h)
      (t⁻¹ * ((-1) ^ Fintype.card V * (Gᶜ.adjMatrix ℝ).charpoly.eval (-(t + 1) / t) /
        (G.adjMatrix ℝ).charpoly.eval t⁻¹ - 1)) := by
  sorry

/-! ### 3.3 Energy -/

/-- The **energy** `E(G) = ∑ |θᵢ|`. (README 3.3) -/
def energy : ℝ := (G.adjSpectrum.map abs).sum

/-- **Energy bounds.** `2√m ≤ E ≤ √(2mn)` and `E ≥ √(2m + n(n-1)|det A|^{2/n})`.
(README 3.3) -/
theorem energy_bounds :
    2 * √(#G.edgeFinset) ≤ G.energy ∧
      G.energy ≤ √(2 * #G.edgeFinset * Fintype.card V) ∧
      √(2 * #G.edgeFinset + Fintype.card V * (Fintype.card V - 1) *
          |(G.adjMatrix ℝ).det| ^ ((2 : ℝ) / Fintype.card V)) ≤ G.energy := by
  sorry

/-- **Rational energy is an even integer.** (README 3.3) -/
theorem energy_eq_two_mul_of_rat (h : ∃ q : ℚ, G.energy = q) : ∃ k : ℕ, G.energy = 2 * k := by
  sorry

end Layer3

end SimpleGraph

/-! ## Layer 4: tight interlacing, star complements and sensitivity -/

namespace Matrix

/-! ### 4.2 Compressions and tight interlacing -/

variable {V ι : Type*} [Fintype V] [DecidableEq V] [Fintype ι] [DecidableEq ι]

/-- **Tight interlacing.** If `S` has orthonormal columns and the eigenvalues of the
compression `SᴴAS` interlace those of `A` tightly, then `AS = S(SᴴAS)`. (README 4.2) -/
theorem IsHermitian.mul_eq_of_isTightInterlacing {A : Matrix V V ℝ} (hA : A.IsHermitian)
    {S : Matrix V ι ℝ} (hS : Sᴴ * S = 1)
    (h : IsTightInterlacing (isHermitian_conjTranspose_mul_mul S hA).eigenvalues₀
      hA.eigenvalues₀) :
    A * S = S * (Sᴴ * A * S) := by
  sorry

end Matrix

namespace SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V] (G : _root_.SimpleGraph V) [DecidableRel G.Adj]

/-! ### 4.3 Star sets and star complements -/

/-- The block of the adjacency matrix with rows in `X` and columns in `Y`. (README 4.3) -/
def adjBlock (X Y : Finset V) : Matrix X Y ℝ :=
  (G.adjMatrix ℝ).submatrix (fun x : X ↦ (x : V)) (fun y : Y ↦ (y : V))

/-- `X` is a **star set** for `θ`: `|X|` is the multiplicity of `θ` and `θ` is not an
eigenvalue of `G - X`. (README 4.3) -/
def IsStarSet (θ : ℝ) (X : Finset V) : Prop :=
  X.card = G.adjSpectrum.count θ ∧ θ ∉ (G.induce (↑Xᶜ : Set V)).adjSpectrum

/-- **Star sets exist.** (README 4.3) -/
theorem exists_isStarSet (θ : ℝ) : ∃ X, G.IsStarSet θ X := by
  sorry

/-- **The star-complement identity.** With `A_X = adjBlock X X`, `B = adjBlock X Xᶜ` and
`C = adjBlock Xᶜ Xᶜ`, `X` is a star set for `θ` exactly when `θ` is not an eigenvalue of `C` and
`θI - A_X = B (θI - C)⁻¹ Bᵀ`. (README 4.3) -/
theorem isStarSet_iff (θ : ℝ) (X : Finset V) :
    G.IsStarSet θ X ↔
      θ ∉ spectrum ℝ (G.adjBlock Xᶜ Xᶜ) ∧
      θ • (1 : Matrix X X ℝ) - G.adjBlock X X =
        G.adjBlock X Xᶜ * (θ • (1 : Matrix ↥(Xᶜ) ↥(Xᶜ) ℝ) - G.adjBlock Xᶜ Xᶜ)⁻¹ *
          G.adjBlock Xᶜ X := by
  sorry

/-- **The eigenspace over a star set.** If `X` is a star set for `θ`, a vector `v` is a
`θ`-eigenvector exactly when its restriction to `Xᶜ` is `(θI - C)⁻¹ Bᵀ` applied to its
restriction to `X`. (README 4.3) -/
theorem IsStarSet.mulVec_eq_smul_iff {θ : ℝ} {X : Finset V} (hX : G.IsStarSet θ X)
    (v : V → ℝ) :
    G.adjMatrix ℝ *ᵥ v = θ • v ↔
      (fun x : ↥(Xᶜ) ↦ v x) =
        (θ • (1 : Matrix ↥(Xᶜ) ↥(Xᶜ) ℝ) - G.adjBlock Xᶜ Xᶜ)⁻¹ *ᵥ
          (G.adjBlock Xᶜ X *ᵥ fun x : X ↦ v x) := by
  sorry

/-- **Reconstruction from a star complement.** Two graphs on `V` with the common star set `X`
for `θ`, the same edges inside `Xᶜ` and the same edges between `X` and `Xᶜ` are equal.
(README 4.3) -/
theorem adj_eq_of_isStarSet {G' : _root_.SimpleGraph V} [DecidableRel G'.Adj] {θ : ℝ}
    {X : Finset V} (hG : G.IsStarSet θ X) (hG' : G'.IsStarSet θ X)
    (hC : ∀ x y, x ∉ X → y ∉ X → (G.Adj x y ↔ G'.Adj x y))
    (hB : ∀ x y, x ∈ X → y ∉ X → (G.Adj x y ↔ G'.Adj x y)) : G = G' := by
  sorry

/-- **The bound on a star complement.** If `θ ∉ {-1, 0}` and `X` is a star set for `θ` whose
star complement has `t` vertices, then `n ≤ t(t+1)/2`, unless `θ = 1` and `G` is `K₂` or `2K₂`.
(README 4.3) -/
theorem card_le_of_isStarSet {θ : ℝ} {X : Finset V} (hX : G.IsStarSet θ X) (hθ : θ ≠ -1)
    (hθ0 : θ ≠ 0) :
    2 * Fintype.card V ≤ Xᶜ.card * (Xᶜ.card + 1) ∨
      (θ = 1 ∧ (Nonempty (G ≃g (⊤ : _root_.SimpleGraph (Fin 2))) ∨
        Nonempty (G ≃g ((⊤ : _root_.SimpleGraph (Fin 2)) ⊕g
          (⊤ : _root_.SimpleGraph (Fin 2)))))) := by
  sorry

/-! ### 4.4 The sensitivity theorem -/

/-- Huang's signing of the `d`-cube: the entry for the edge from `x` flipping coordinate `i` is
`(-1)^{#{j < i | x j}}`. (README 4.4) -/
def hypercubeSigning (d : ℕ) : Matrix (Fin d → Bool) (Fin d → Bool) ℝ :=
  fun x y ↦ ∑ i : Fin d,
    if y = Function.update x i (!x i) then
      (-1) ^ (Finset.univ.filter fun j : Fin d ↦ j < i ∧ x j = true).card
    else 0

/-- The signing has the hypercube as its pattern: `|B x y| = A x y`. (README 4.4) -/
theorem abs_hypercubeSigning (d : ℕ) (x y : Fin d → Bool) :
    |hypercubeSigning d x y| = (hypercube d).adjMatrix ℝ x y := by
  sorry

/-- **Huang's signing squares to `dI`.** (README 4.4) -/
theorem hypercubeSigning_mul_self (d : ℕ) :
    hypercubeSigning d * hypercubeSigning d = (d : ℝ) • (1 : Matrix _ _ ℝ) := by
  sorry

/-- The signing is symmetric, with eigenvalues `±√d`, each of multiplicity `2^{d-1}` for
`d ≥ 1`. (README 4.4) -/
theorem hypercubeSigning_spectrum {d : ℕ} (hd : 1 ≤ d) :
    ∃ h : (hypercubeSigning d).IsHermitian,
      Multiset.map h.eigenvalues₀ Finset.univ.val =
        Multiset.replicate (2 ^ (d - 1)) √d + Multiset.replicate (2 ^ (d - 1)) (-√d) := by
  sorry

/-- **The sensitivity theorem, graph form.** For `d ≥ 1`, every induced subgraph of the `d`-cube
on `2^{d-1} + 1` vertices has maximum degree at least `√d`: Huang's theorem of
DecisionTreeComplexity 5.1, which owns it, translated to `hypercube d` and `maxDegree`.
(README 4.4) -/
theorem sqrt_le_maxDegree_induce_hypercube {d : ℕ} (hd : 1 ≤ d) (s : Finset (Fin d → Bool))
    (hs : s.card = 2 ^ (d - 1) + 1) :
    √d ≤ ((hypercube d).induce (s : Set (Fin d → Bool))).maxDegree := by
  sorry

end SimpleGraph

end TauCetiRoadmap.CharacteristicPolynomialsAndStarComplements

/-! ## Library declarations consumed

Pinned library declarations named in the supplier contracts of `README.md`. -/

-- Mathlib
#check @Matrix.charpoly
#check @Matrix.inv
#check @Polynomial.map
#check @Polynomial.natTrailingDegree
#check @Int.castRingHom
#check @Fintype.card
#check @Multiset.count
#check @Matrix.charpoly_coeff_eq_sum_minors
#check @Matrix.det_apply'
#check @Matrix.twoBlockTriangular_det
#check @hammingDist
#check @Polynomial.rootMultiplicity_eq_natTrailingDegree'
#check @Polynomial.eq_rootMultiplicity_map
#check @Matrix.kronecker
#check @Matrix.trace_kronecker
#check @Matrix.det_add_replicateCol_mul_replicateRow
#check @Matrix.det_fromBlocks₂₂
#check @Matrix.fromBlocks_eq_of_invertible₂₂
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.IsHermitian.det_eq_prod_eigenvalues
#check @Matrix.isHermitian_conjTranspose_mul_mul
#check @eigenvalue_mem_ball
#check @Finset.sum_mul_sq_le_sq_mul_sq
#check @Real.geom_mean_le_arith_mean_weighted
#check @Real.rpow
#check @IsIntegral
#check @IsIntegral.add
#check @IsIntegrallyClosed.isIntegral_iff
#check @Submodule.starProjection
#check @SimpleGraph.adjMatrix
#check @SimpleGraph.lapMatrix
#check @SimpleGraph.Embedding.submatrix_adjMatrix
#check @SimpleGraph.Subgraph.IsMatching
#check @SimpleGraph.Subgraph.IsPerfectMatching
#check @SimpleGraph.IsAcyclic
#check @SimpleGraph.IsTree
#check @SimpleGraph.fromEdgeSet
#check @SimpleGraph.induce
#check @SimpleGraph.cliqueFinset
#check @SimpleGraph.maxDegree
#check @SimpleGraph.boxProd
#check @SimpleGraph.sum
#check @completeBipartiteGraph

-- Tau Ceti
#check @LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq

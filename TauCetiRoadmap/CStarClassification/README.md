# Roadmap: classification of AF and purely infinite simple C*-algebras

**Summary.** Two classification theories are built with their construction, existence and
uniqueness results: AF algebras by scaled ordered K₀ (Elliott), and Kirchberg algebras by
KK-equivalence (Kirchberg–Phillips), with the K-theoretic specialization under the universal
coefficient theorem. From the C*-algebra, Hilbert-module, K-theory and crossed-product
foundations of the operator-algebra family, the roadmap develops the approximation and
intertwining methods (Layer 1), AF structure theory (Layer 2), dimension groups, scales, traces
and UHF algebras (Layer 3), pure infiniteness and projection comparison (Layer 4), sequence
algebras, O₂ uniqueness and the exact embedding theorem (Layer 5), tensor absorption by O₂ and
O∞ (Layer 6), full homomorphisms and the homomorphism picture of KK (Layer 7), and the
classification, automorphism and range theorems with the Cuntz-algebra examples (Layer 8). The
end theorems are Elliott's classification of AF algebras by `(K₀(A),K₀(A)⁺,Σ(A))` with the
scaled range theorem, Glimm's classification of UHF algebras, Kirchberg's exact embedding
theorem `A ↪ O₂`, the absorption theorems `A⊗O₂≅O₂` and `A≅A⊗O∞`, Phillips's homomorphism
theorem and the Kirchberg–Phillips classification of Kirchberg algebras with its UCT form.

## Scope and ownership

This roadmap owns: approximate and asymptotic unitary equivalence of *-homomorphisms and
Elliott's approximate intertwining (Layer 1); the structure, permanence and K₀-classification of
AF algebras (Layer 2); dimension groups, the Effros–Handelman–Shen theorem, scales, the scaled
range theorem, the ideal and trace theory of AF algebras and UHF algebras with Glimm's
classification (Layer 3); Cuntz subequivalence, infinite and properly infinite projections,
purely infinite simple algebras, the slice lemma and Kirchberg's tensor criterion, Zhang's
dichotomy and the corner embeddings of O₂ and O∞ (Layer 4); norm sequence algebras and
ultrapowers, O₂ uniqueness, `O₂⊗O₂≅O₂` and the exact embedding theorem with its translation
crossed-product proof (Layer 5); O₂ and O∞ absorption and central-sequence absorption
(Layer 6); full homomorphisms, Cuntz sums, full asymptotic morphisms, Phillips's deformation
theorem, the homomorphism picture of KK and the homomorphism theorem (Layer 7); the
Kirchberg–Phillips classification, the automorphism theorem, the range theorem through the KK
telescope and the Cuntz-algebra computations (Layer 8).

The layers carry the labels CL1–CL8 (Layer k is CLk) under which other roadmaps cite them:
OperatorAlgebraDynamics D2 and D6 name CL5 and this roadmap's AF classification,
AlgebraicTopology Stage 6.0 names CL8, and TemperleyLiebOperatorAlgebras names CL2.

Left to named roadmaps, and imported rather than planned here:

- CStarAlgebras C1–C2 own hereditary subalgebras, closed ideals, corners, multiplier algebras
  and representations; C5 owns bounded products, c₀ sums, their quotients and C*-inductive
  limits; C6–C7 own nuclearity, exactness and the Choi–Effros lifting theorem; C8 owns
  quasidiagonality; C9 owns the norm stability of matrix-unit relations, finite-dimensional
  approximate intertwining, Voiculescu's homotopy invariance of quasidiagonality with the cone
  theorem, and the analytic AF-embedding theorem, which is independent of classification and
  stays there.
- HilbertModules H1–H4 own compact module operators, stabilization, full corners and strong
  Morita equivalence; its H3 definition of type I (every irreducible image contains the compact
  operators) is the one used in Kirchberg's tensor criterion (§4.4).
- OperatorKTheory K1–K3 own projections, `K₀`, `K₁`, continuity, exactness and Bott periodicity;
  K5–K6 own KK, the Kasparov product and semisplit exactness; K7 owns the Cuntz algebras `O_n`,
  `O∞` and the Toeplitz–Cuntz algebras `E_n` with their K-groups and unit classes; K8 owns the
  bootstrap class, the UCT condition, countable free resolutions and the KK-equivalence `ℂ→O∞`;
  K9 owns asymptotic morphisms, E-theory and its universal property. Which *-isomorphism classes
  the invariants distinguish is decided here, not there.
- OperatorAlgebraDynamics D1–D4 own crossed products and duality, including the
  coefficient-tensor identification for `G=ℤ`; D6 owns the universal models of `O_n` with their
  simplicity and nuclearity; D8 owns the CAR algebra and its matrix-limit presentation.
- VonNeumannAlgebras, *C*-algebra and state prerequisites* and *Type I and finite-dimensional
  algebras*, own the faithful direct-sum representation of a C*-algebra, matrix units from
  orthogonal equivalent projections and the finite-dimensional matrix-block decomposition with
  its inclusion matrices. CStarAlgebras C9 supplies the norm perturbation theory; tracial L²
  perturbation is a different result and is not used.
- AlgebraicTopology Stage 6.0 owns the generic lim and lim¹ of countable inverse systems with
  their functoriality and vanishing; the KK telescope and its Milnor sequence are targets here
  (§8.6).
- Tau Ceti owns supernatural numbers (`TauCeti.Supernatural`); the UHF invariant is a value in
  that type (§3.5).

Outside scope: classification of nonsimple purely infinite algebras, classification of group
actions, stably finite algebras beyond AF (in particular Z-stable classification and the Cuntz
semigroup as a classifying invariant), and any assertion that every nuclear C*-algebra satisfies
the UCT.

## Conventions

Algebras are complex C*-algebras. AF means a sequential increasing union of finite-dimensional
C*-subalgebras with norm-dense union; the zero algebra and nonunital algebras are included. A
UHF algebra is a nonzero unital inductive limit of full matrix algebras with unital connecting
maps; finite matrix algebras are included. A Kirchberg algebra is a nonzero separable nuclear
purely infinite simple C*-algebra; unitality, stability and the UCT are additional hypotheses,
never implicit in that name.

Use Mathlib's `NonUnitalCStarAlgebra`, `CStarAlgebra`, `NonUnitalStarAlgHom`, `StarAlgHom`,
`StarAlgEquiv`, `IsStarProjection` and `CStarMatrix`. Nonunital maps need not preserve an
ambient unit. Simplicity of a C*-algebra means that its only closed two-sided ideals are `0` and
the algebra; it is not Mathlib's algebraic `IsSimpleRing` (the compact operators are C*-simple
and not algebraically simple). All ideals used as C*-algebras or quotients are norm closed.
Write `K=K(ℓ²(ℕ,ℂ))`, `Aˢ=A⊗min K` and `M(A)` for the multiplier algebra. Stable means `A≅Aˢ`;
the stabilization of a unital algebra is nonunital unless the algebra is zero. All tensor
products are minimal unless specified otherwise. `Ad(u)(a)=u a u*`.

Ordered groups use Mathlib's additive-group and order structures with a translation-invariant
order (`IsOrderedAddMonoid`); the positive cone is `G⁺={g : 0 ≤ g}`. Interpolation groups and
dimension groups are not assumed lattice ordered. The positive cone `K₀(A)⁺` is inherited from
OperatorKTheory K1 and is not assumed to be a proper cone for arbitrary A. The scale is
`Σ(A)={[p] : p a projection in A}`, without stabilization; the positive cone is generated by
projections in matrix algebras over A. The unit class `[1_A]` is part of a unital classification
invariant. UHF invariants are supernatural numbers in `TauCeti.Supernatural`, ordered by
divisibility, with `ofNat` the embedding of `ℕ+`.

Approximate unitary equivalence is always qualified by where its unitaries live: in the unital
target B (`ApproximatelyUnitarilyEquivalent` in `Suggested.lean`), in the multiplier algebra
`M(B)`, or in the minimal unitization `B⁺`; each theorem below states which. Asymptotic unitary
equivalence uses a norm-continuous path `u:[0,∞)→U` and pointwise convergence as `t→∞`, with
no condition on `u(0)`.

## Exact supplier contracts

### From Mathlib

`NonUnitalCStarAlgebra`, `CStarAlgebra` and the instance `CStarAlgebra.toNonUnitalCStarAlgebra`;
`NonUnitalStarAlgHom`, `StarAlgHom`, `StarAlgEquiv` with `StarAlgEquiv.toNonUnitalStarAlgHom`;
`NonUnitalStarSubalgebra`, `StarSubalgebra` (unital, so inclusions between them are unital);
`IsStarProjection`; `unitary`; the continuous functional calculus; `CStarMatrix` for the C*-norm
on matrix algebras and `Matrix (Fin n) (Fin n) ℂ` for their algebraic structure;
`TopologicalSpace.SeparableSpace`; `FiniteDimensional`; `Dense`; `IsOrderedAddMonoid`,
`IsDirected`, `DirectedOn`, `AntisymmRel`, `Monotone` (positivity of an additive map between
partially ordered groups); `AddMonoidHom` and `Countable`. Mathlib has no dimension groups,
Riesz interpolation, unperforation, Cuntz subequivalence, C*-simplicity or hereditary
C*-subalgebras: those are targets here.

### From Tau Ceti

`TauCeti.Supernatural` in `TauCeti.NumberTheory.Supernatural`: `ofNat : ℕ+ → Supernatural`,
the `CompleteLattice` instance with pointwise exponent order (`iSup_apply`),
`ofNat_le_ofNat_iff` (`ofNat m ≤ ofNat n ↔ m ∣ n`), `ofNat_mul`, `ofNat_gcd`, `ofNat_lcm`,
`one_eq_bot` and `ofNat_one`. Assumed: divisibility is the lattice order, so the supremum of a
divisibility chain of naturals is their formal least common multiple.

### From TauCetiRoadmap.CStarAlgebras

C1–C2: hereditary subalgebras, closed ideals, corners, multiplier algebras, irreducible
representations. C5: bounded products `ℓ∞(A)`, c₀ sums, their closed-ideal quotients, and
C*-inductive limits with noninjective connecting maps, with universal properties and norm
formulas. C6–C7: nuclearity, exactness, the Choi–Effros lifting theorem and CP-lifting
perturbation. C8: quasidiagonality. C9: norm stability of finite matrix-unit relations with
unitary conjugacy of nearby systems by unitaries close to 1, approximate intertwining for
sequences of finite-dimensional algebras, Voiculescu's homotopy invariance of quasidiagonality
with the cone theorem (`CA` quasidiagonal for separable A), and Dadarlat's external
finite-dimensional approximation. Assumed: these hold at the generality stated there, including
nonunital algebras.

### From TauCetiRoadmap.HilbertModules

H1–H2: Hilbert modules, adjointable and compact module operators. H3: induction and
imprimitivity, strong Morita equivalence, and the definition of type I used in §4.4. H4:
countable generation and Kasparov stabilization, full corners and `A⊗K`.

### From TauCetiRoadmap.OperatorKTheory

K1–K3: `K₀`, `K₁`, their positive cone and scale, functoriality, continuity under inductive
limits, half-exactness, the six-term sequence and Bott periodicity. K5: KK-groups and countable
additivity in the first variable. K6: the Kasparov product, semisplit exactness and the universal
property. K7: `E_n`, `O_n`, `O∞`, their K-groups with `[1]↦1` in `K₀(O∞)=ℤ` and
`K₀(O_n)=ℤ/(n−1)`, and the Künneth sequence. K8: the bootstrap class, the UCT condition,
countable free resolutions, the product-compatible lifting of a K-isomorphism to a
KK-equivalence, and the KK-equivalence `ℂ→O∞`. K9: asymptotic morphisms, homotopy into
`C([0,1],B)`, reparameterization and the E-theory universal property.

### From TauCetiRoadmap.OperatorAlgebraDynamics

D1–D2: full and reduced crossed products, the coefficient-tensor identification
`(A⋊G)⊗min D ≃ (A⊗min D)⋊G` for the trivial action on D, exactness of crossed products of exact
algebras by amenable groups, and the full-product identification with generator formulas for
`G=ℤ`. D3–D4: induction, imprimitivity and Takai duality. D6: the universal `O_n`, its gauge
action and core, simplicity and nuclearity. D8: the CAR algebra and its presentation as the
inductive limit of `M_(2ⁿ)` with unital connecting maps.

### From TauCetiRoadmap.VonNeumannAlgebras

The sections *C*-algebra and state prerequisites* and *Type I and finite-dimensional algebras*:
the faithful direct-sum (Gelfand–Naimark) representation; matrix units from orthogonal
equivalent projections; the decomposition of a finite-dimensional C*-algebra as a finite direct
sum of matrix algebras and the classification of unital inclusions by inclusion matrices.

### From TauCetiRoadmap.AlgebraicTopology

Stage 6.0: the generic lim and lim¹ of a countable inverse system of abelian groups as the
kernel and cokernel of `1−shift` on the product, functoriality under tower maps, and vanishing
for towers with surjective (or constant) transition maps.

## How to read the build

The layers are in build order. Layer 1 supplies the equivalence relations on *-homomorphisms,
the classification of maps between finite-dimensional algebras, finite-dimensional
semiprojectivity, projection cancellation and Elliott's intertwining. Layer 2 proves the
structure, permanence and K₀-classification of AF algebras. Layer 3 supplies the ordered-group
side (dimension groups, Effros–Handelman–Shen, scales, the scaled range theorem, ideals and
traces) and the UHF algebras. Layer 4 develops projection comparison and pure infiniteness up to
Kirchberg's tensor criterion and the corner embeddings of O₂ and O∞. Layer 5 builds sequence
algebras, O₂ uniqueness and the exact embedding theorem. Layer 6 proves O₂ and O∞ absorption.
Layer 7 builds fullness, Cuntz sums, full asymptotic morphisms and the homomorphism picture of
KK up to the homomorphism theorem. Layer 8 assembles the Kirchberg–Phillips classification, the
automorphism theorem, the range theorem and the examples. Layers 4–8 use Layers 1–3 only
through Layer 1's equivalence relations, perturbation lemmas and intertwining.

## Layer 1: Finite-dimensional maps and approximate intertwining (CL1)

### 1.1 Approximate and asymptotic unitary equivalence

Develop the point-norm topology on *-homomorphisms and continuity of composition. For maps
`φ,ψ:A→B` define approximate unitary equivalence: for every finite `F⊂A` and `ε>0` there is a
unitary u in `M(B)` with `‖uφ(a)u*−ψ(a)‖<ε` on F (Rørdam, Definition 1.1.15; Kirchberg–Phillips,
Definition 0.5 for the unital-target form). Develop also the version with unitaries in the
minimal unitization `B⁺` and the unital-target specialization `ApproximatelyUnitarilyEquivalent`
of `Suggested.lean`, whose unitaries lie in B itself; every theorem below states which version it
establishes. Prove that for separable A each version is equivalent to the existence of a
sequence of unitaries `u_n` with `u_nφ(a)u_n*→ψ(a)` for every a (diagonal argument over a dense
sequence and `ε=1/n`). Define asymptotic unitary equivalence by a norm-continuous path
`u:[0,∞)→U(M(B))` with `u_tφ(a)u_t*→ψ(a)` as `t→∞`, with no condition on `u(0)`; requiring
`u(0)=1` is a separate, stronger relation. Prove that both are equivalence relations, that they
are preserved by restriction to subalgebras, by stabilization and by composition with a fixed
map on either side, retaining the hypotheses needed to extend maps to multiplier algebras
(nondegeneracy). Prove that approximately unitarily equivalent maps induce the same map on
`K₀` and `K₁`; do not assert that they have the same KK-class. *Needs:* Mathlib `unitary`,
`NonUnitalStarAlgHom`; CStarAlgebras C1 (multiplier algebras); OperatorKTheory K1–K2.

**Checks.**

- Two maps `ℂ→M₂` sending 1 to rank-one projections p, q are unitarily equivalent (a unitary
  swapping ranges), hence approximately unitarily equivalent; the maps `z↦diag(z,0)` and
  `z↦diag(z,z)` are not, since `‖u p u*−1‖=1` for every unitary u.
- A map and its conjugate by a fixed unitary are asymptotically unitarily equivalent with a
  constant path; the definition with `u(0)=1` forced would fail for `Ad(u)` with u in a
  nontrivial component of `U(B)`, which is why `u(0)` is unconstrained.
- With unitaries in `M(B)` for `B=K`, the maps `ℂ→K` sending 1 to rank-one projections p, q are
  approximately unitarily equivalent, since `p∼q` in K gives a unitary of `B(ℓ²)=M(K)` swapping
  them; with unitaries in `K⁺=K+ℂ1` the same holds. A plausible wrong definition quantifying
  over unitaries of the nonunital B itself would make the relation empty for `B=K`.
- Approximate unitary equivalence preserves `K₀`: for the two maps `ℂ→M₂` above both send
  `[1]` to `[p]=[q]=1∈K₀(M₂)=ℤ`; the non-equivalent pair sends `[1]` to 1 and 2 respectively.

### 1.2 Homomorphisms between finite-dimensional algebras

Classify *-homomorphisms between finite direct sums of full matrix algebras by their
nonnegative-integer multiplicity matrices (VonNeumannAlgebras, *Type I and finite-dimensional
algebras*, inclusion matrices; Rørdam, §1.1). With source block sizes `n_i` and target sizes
`m_j`, a matrix `(h_ji)` is realized by a *-homomorphism iff `∑ᵢ h_ji n_i≤m_j` for each j, with
equality exactly for unital maps. Prove uniqueness up to unitary conjugacy in the target,
composition by matrix multiplication, and that the induced map `K₀(F)→K₀(F')` in
minimal-projection coordinates is the multiplicity matrix. Relate the coordinate map to the
matrix-unit realization, including zero blocks (a zero row or column) and noninjective maps (a
zero column). *Needs:* VonNeumannAlgebras *Type I and finite-dimensional algebras*;
OperatorKTheory K1.

**Checks.**

- `M₂⊕ℂ→M₅⊕M₃` with matrix `((2,1),(1,1))`: `2·2+1·1=5` and `1·2+1·1=3`, unital; the matrix
  `((2,1),(2,0))` fails since `2·2+0=4≠3` and `4≤3` is false.
- The two maps `ℂ→M₂` of §1.1 have multiplicity matrices `(1)` and `(2)`, distinguishing them.
- Composition `ℂ→M₂→M₄` with matrices `(2)` and `(2)` has matrix `(4)`: the unital embedding
  `M₂→M₄` composed with `z↦z1` is `z↦z1_4`, whose multiplicity is 4.

### 1.3 Finite-dimensional semiprojectivity and perturbation

Reuse CStarAlgebras C9's norm stability of finite matrix-unit relations and conjugacy of nearby
exact systems by unitaries close to 1. Derive finite-dimensional semiprojectivity: for F
finite-dimensional, J the closure of an increasing union of closed ideals `J_n⊲D`, every
*-homomorphism `F→D/J` lifts to `D/J_n` for some n (Rørdam, §1.2; Blackadar, Chapter 7,
finite-stage lifting). Prove the finite-stage perturbation result for maps into a C*-inductive
limit: a map from F into the limit is approximately unitarily equivalent, by a unitary close to
1, to a map into a finite stage. These lemmas supply the passage from local finite-dimensional
approximation to nested subalgebras in §2.1. *Needs:* CStarAlgebras C5 (inductive limits), C9
(matrix-unit stability); VonNeumannAlgebras *Type I and finite-dimensional algebras*.

**Checks.**

- For `F=ℂ` the statement is lifting of a projection from `D/J` to some `D/J_n`: in
  `D=ℓ∞(ℕ)`, `J_n` the sequences vanishing beyond n and `J=c₀`, the class of `(1,1,1,…)` lifts
  to `D/J_1` already.
- The unitary correction is needed: in `D=ℓ∞(ℕ,M₂)` with `J=c₀(ℕ,M₂)`, the classes of the
  constant sequence `diag(1,0)` and of `(q_n)`, `q_n` the rank-one projection at angle `1/n` to
  it, are orthogonal in `D/J`; the exact lift of the resulting map `ℂ²→D/J` to a stage `D/J_n`
  exists only after conjugating `(q_m)_(m≥n)` by a unitary at distance `O(1/n)` from 1.
- A map `M₂→lim A_n` lands, up to a unitary close to 1, in some `A_n`: for the CAR algebra with
  stages `M_(2ⁿ)` and the embedding of `M₂` as the first tensor factor, the stage is `n=1` with
  the unitary equal to 1.

### 1.4 Projection cancellation and lifting of K₀-maps from finite-dimensional sources

Projection cancellation for B means that projections p, q, r in matrix algebras over B with
`p⊕r∼q⊕r` (equivalence after embedding in a common matrix algebra) satisfy `p∼q`; prove its
equivalent formulation as cancellativity of the Murray–von Neumann semigroup `V(B)`. For F
finite-dimensional and B unital with projection cancellation, prove that every group map
`K₀(F)→K₀(B)` sending `Σ(F)` into `Σ(B)` is induced by a *-homomorphism `F→B`, unital exactly
when `[1_F]↦[1_B]`, and that two such homomorphisms with equal K₀-maps are unitarily conjugate
(Rørdam, §1.3; Blackadar, Chapter 7). Construct orthogonal
representatives of the images of the minimal projections, complete them to matrix units, and
account for the complement of the image of the unit. Establish the nonunital target version
when the minimal unitization `B⁺` has cancellation, with unitaries of `B⁺` and the scale
condition `Σ(F)→Σ(B)`. *Needs:* §1.2; OperatorKTheory K1; VonNeumannAlgebras *Type I and
finite-dimensional algebras* (matrix units).

**Checks.**

- `B=M₂`: `Σ(M₂)={0,1,2}⊂K₀=ℤ`; the map `K₀(ℂ)=ℤ→ℤ`, `1↦1`, is induced by `z↦diag(z,0)`,
  nonunital since `[1]↦1≠2`; the map `1↦3` sends `Σ(ℂ)={0,1}` to `{0,3}⊄Σ(M₂)` and is
  induced by no map.
- Cancellation fails for `B=O₂`: a Cuntz pair gives `1⊕1∼1=1⊕0` in `M₂(O₂)`, while `1≁0`;
  so the lifting statement is restricted to targets with cancellation, and §4.5 handles properly
  infinite targets separately.
- Uniqueness up to conjugacy: the two unital maps `M₂→M₄`, `x↦x⊗1` and `x↦1⊗x`, have the same
  K₀-map `(2)` and are conjugate by the flip unitary of `ℂ²⊗ℂ²`.

### 1.5 Elliott's approximate intertwining

Extend CStarAlgebras C9's finite-dimensional analytic intertwining to Elliott's
approximate-intertwining theorem for sequential C*-inductive systems with noninjective
connecting maps (Rørdam, §2.3). For systems `A_n→α_n A_(n+1)` and `B_n→β_n B_(n+1)` with maps
`φ_n:A_n→B_(n+1)` and `ψ_n:B_n→A_n` such that, on finite sets `F_n⊂A_n` and `G_n⊂B_n`,
`ψ_(n+1)φ_n≈α_n` and `φ_nψ_n≈β_n` with summable positive errors, the finite sets propagate
under all four maps, and every element of every stage is approximated after passage to later
stages, construct the limit maps from the Cauchy sequences of forward images; prove they are
mutually inverse *-isomorphisms, give the tail-error estimates and identify their K-theory maps.
Show how approximately commuting unitary diagrams are conjugated into such a diagram, including
the multiplier-extension requirements on the maps. Deduce `elliott_intertwining`: for separable
unital A, B and *-homomorphisms `φ:A→B`, `ψ:B→A` with `ψφ` approximately unitarily equivalent
to `id_A` and `φψ` to `id_B` (unitaries in A and in B respectively), there is a *-isomorphism
`A≅B` approximately unitarily equivalent to φ (Kirchberg–Phillips, Lemma 0.6 for the
isomorphism; Rørdam, §2.3 for the equivalence to φ). The hypotheses force φ and ψ to be unital.
*Needs:* §1.1; CStarAlgebras C5 (inductive limits), C9 (finite-dimensional intertwining).

**Checks.**

- `A=B=ℂ`, `φ=ψ=id`: the hypotheses hold with `u=1` and `θ=id` is the isomorphism.
- One-sided hypotheses do not suffice: `A=ℂ`, `B=ℂ⊕ℂ`, `φ(z)=(z,z)`, `ψ(z,w)=z` have
  `ψφ=id_ℂ`, but `φψ(z,w)=(z,z)` is not approximately unitarily equivalent to `id_B` (unitaries
  of `ℂ⊕ℂ` are diagonal and fix `(z,z)`), and indeed `ℂ≇ℂ⊕ℂ`.
- The unital forcing: if `ψφ≈_u id_A` then `ψφ(1)` is a projection within distance `<1` of 1,
  hence equal to 1, so `φ(1)=1` after applying the same argument to φψ.
- An intertwining with summable errors `ε_n=2^(−n)` between the constant systems `A_n=M₂`
  (identity connecting maps) and `B_n=M₂` with `φ_n=Ad(u_n)`, `ψ_n=Ad(u_n*)` gives the limit
  isomorphism `Ad(lim u_n)` when `(u_n)` converges, and the construction's Cauchy estimate is
  exactly the summability of `‖u_(n+1)−u_n‖`.

### Examples

The two embeddings `ℂ→M₂` of §1.1 and their multiplicity matrices `(1)`, `(2)`; the unital
inclusion `M₂⊕ℂ⊂M₅⊕M₃` of §1.2; the CAR algebra as the inductive limit of `M_(2ⁿ)` with the
first-tensor-factor embeddings, on which §1.3 and §1.5 are exercised (OperatorAlgebraDynamics
D8).

### Dependencies

Mathlib; CStarAlgebras C1, C5 and C9; OperatorKTheory K1–K2; VonNeumannAlgebras *Type I and
finite-dimensional algebras*.

## Layer 2: AF structure and classification (CL2)

### 2.1 Local characterization of AF algebras

Define `IsAF` as in `Suggested.lean`: an increasing sequence of finite-dimensional
C*-subalgebras with dense union, nonunital algebras and the zero algebra included. Prove
`isAF_iff_local_approximation`: for separable A, `IsAF A` holds iff every finite subset is
approximated to every positive tolerance inside a finite-dimensional C*-subalgebra (Bratteli,
Theorem 2.2, for unital A; reduce the nonunital case through the unitization, since A is AF iff
`A⁺` is AF). Prove equivalence with being a sequential C*-inductive limit of finite-dimensional
C*-algebras with (possibly noninjective) connecting maps. Use §1.3 to make the approximating
subalgebras nested while including a previously specified finite-dimensional subalgebra
(Bratteli, Theorem 2.2, second statement). For unital AF algebras obtain presentations by unital
subalgebras and unital maps. *Needs:* Mathlib `NonUnitalStarSubalgebra`, `FiniteDimensional`,
`TopologicalSpace.SeparableSpace`; §1.3; CStarAlgebras C5.

**Checks.**

- `A=0`: `IsAF` holds with every stage `⊥`, and the local condition holds trivially.
- `A=C[0,1]`: its finite-dimensional C*-subalgebras are `0` and `ℂ1` (no nontrivial projections),
  so the identity function is not within `1/2` of any of them; both sides are false.
- `A=ℓ∞(ℕ)`: the local condition holds (finite-valued step functions), but `A` is nonseparable
  and not a sequential union of finite-dimensional subalgebras; separability is a genuine
  hypothesis of the equivalence.
- `A=K`: AF with stages `M_n` (upper-left corners) and dense union the finite-rank operators;
  the nonunital clause is needed since no stage contains the unit of `B(ℓ²)`.

### 2.2 Bratteli diagrams

Define a Bratteli diagram: finite vertex sets at each level, positive vertex sizes and finite
edge multiplicities satisfying the block-size inequalities of §1.2 (Bratteli, 1.8; Rørdam, §1.2).
Construct the associated inductive system of finite-dimensional algebras, compute its K₀
connecting maps as the multiplicity matrices, and prove invariance of the limit algebra under
telescoping and under unitary change of matrix-unit choices. Recover a diagram from an AF
presentation. The diagram is presentation data, not an invariant: classification uses its scaled
ordered-group limit (§2.6). *Needs:* §1.2; §2.1; OperatorKTheory K1, K3 (continuity of K₀).

**Checks.**

- The constant diagram with one vertex of size `2ⁿ` at level n and multiplicity 2 presents the
  CAR algebra; its K₀ connecting maps are multiplication by 2 on ℤ.
- The diagram with vertices of sizes `(1,1)` at every level and the identity matrix presents
  `ℂ⊕ℂ`, not ℂ: two telescoped diagrams with different vertex counts can present isomorphic
  algebras only through the limit group, here `ℤ²≠ℤ`.
- The Fibonacci diagram with sizes `(F_(n+1),F_n)` and matrix `((1,1),(1,0))` has limit group
  `ℤ²` with the irrational-slope order; telescoping by two steps replaces the matrix by its
  square and presents the same algebra.

### 2.3 Real rank zero, stable rank one and cancellation

Prove that AF algebras have real rank zero (finite-spectrum self-adjoint elements are dense in
the self-adjoint part) and stable rank one (invertibles are dense in the minimal unitization,
in A itself when A is unital) (Rørdam, §§1.2–1.3; Blackadar, Chapter 7). Establish the projection-approximate-unit characterization of real rank
zero for the hereditary subalgebras used here. Prove projection cancellation (§1.4) for AF
algebras, in its matrix and unitization forms; projection equivalence is thus determined by K₀.
Show that projections and their equivalences are represented at finite stages and that equality
of limit K₀-classes holds at a sufficiently late stage. Deduce `K₁(A)=0` and identify `K₀(A)⁺`
and `Σ(A)` as the images of their finite-stage counterparts. *Needs:* §1.3, §1.4, §2.1;
OperatorKTheory K1–K3.

**Checks.**

- `C[0,1]` has real rank one, not zero: the identity function is not a norm limit of
  finite-spectrum self-adjoints (a finite-spectrum self-adjoint is locally constant on a
  connected space, hence constant); consistent with §2.1, it is not AF.
- `K₁(CAR)=0`, while `K₁(C(S¹))=ℤ`: an AF algebra contains no unitary with nontrivial `K₁`-class,
  so `C(S¹)` is not AF.
- Cancellation in `K`: `p⊕r∼q⊕r` for finite-rank projections gives `rank p=rank q`, hence `p∼q`.

### 2.4 Permanence

Prove permanence of AF under closed ideals, quotients, hereditary subalgebras, finite direct
sums, stabilization, sequential inductive limits and minimal tensor products (Bratteli, Theorem 3.3 for
ideals and quotients; Rørdam, §1.2). Deduce invariance under strong Morita equivalence for
separable algebras through HilbertModules H3–H4 (Morita equivalent separable algebras are stably
isomorphic). Use projection corners and §1.3's perturbation estimates for hereditary subalgebras
rather than assuming their intersections with the chosen finite stages are dense. Compute the
diagrams and ordered K₀ maps in these constructions. *Needs:* §1.3, §2.2; CStarAlgebras C1
(hereditary subalgebras, ideals), C5 (tensor products, inductive limits); HilbertModules H3–H4.

**Checks.**

- The ideal `K⊲K⁺` and the quotient `K⁺/K=ℂ` are AF with K₀ sequence `ℤ→ℤ⊕ℤ→ℤ`, the first map
  `1↦(1,0)` and the second the projection to the second coordinate.
- `CAR⊗M₃` is AF with stages `M_(3·2ⁿ)` and invariant `(ℤ[1/2], ℤ[1/2]≥0, 3)`.
- For a projection p at stage n of the CAR algebra the corner `pAp` is AF with stages
  `pA_mp`, `m≥n`; for a positive element a with no finite-stage representative the hereditary
  subalgebra it generates meets no stage densely, and is AF by the perturbation argument.

### 2.5 Finite-stage factorization of scaled maps

Prove the finite-stage factorization lemma for scaled positive maps from a simplicial group into
an AF K₀ limit: finitely many generators, positive representatives, scale bounds and finitely
many specified equalities can be realized simultaneously at one sufficiently late stage
(Rørdam, Proposition 1.3.4; Blackadar, Theorem 7.3.2). Use it with §1.4 to lift
an intertwining of scaled K₀ groups to an intertwining of finite-dimensional C*-algebras.
*Needs:* §1.4, §2.3; OperatorKTheory K3 (continuity).

**Checks.**

- The positive map `ℤ→K₀(CAR)=ℤ[1/2]`, `1↦1/4`, factors through the stage `K₀(M₄)=ℤ`, `1↦1`,
  and not through `K₀(M₂)=ℤ`, whose image is `ℤ·(1/2)`.
- A specified equality `2·(1/4)=1/2` holds at stage 4 since both sides are the class of a
  rank-two projection in `M₄`.
- The scale bound `1/4∈Σ(CAR)=[0,1]` is witnessed at stage 4 by a rank-one projection.

### 2.6 Existence, uniqueness and classification

For AF algebras A, B establish (Rørdam, Theorem 1.3.3, Proposition 1.3.4 and §1.4; Blackadar,
Theorem 7.3.2 and §7.4):

- Existence: every group homomorphism `α:K₀(A)→K₀(B)` with `α(Σ(A))⊆Σ(B)` is induced by a
  *-homomorphism `A→B`.
- Uniqueness: two maps `A→B` induce the same K₀-map iff they are approximately unitarily
  equivalent with unitaries in `B⁺`. Prove the asymptotic version by joining successive
  implementing unitaries through paths in the relative commutants of finite-dimensional image
  subalgebras in `B⁺`; prove these commutants are AF, including the complementary corner when
  the maps are nonunital, and that the unitary group of a unital AF algebra is path connected.
- Classification: every scaled-group isomorphism is induced by a *-isomorphism. Thus
  `(K₀(A),K₀(A)⁺,Σ(A))` classifies AF algebras; in the unital case replace `Σ(A)` by `[1_A]`,
  since `Σ(A)=[0,[1_A]]`.
- Stable classification: the ordered group without a scale classifies AF algebras up to stable
  isomorphism, through `Σ(A⊗K)=K₀(A)⁺` and stabilization.

These are existence statements for an isomorphism realizing the invariant, not uniqueness of
the isomorphism as a function. For a map `φ:A→B` of AF algebras prove that φ is injective iff
`K₀(φ)` sends every nonzero element of `Σ(A)` to a nonzero element. Prove that an automorphism
of an AF algebra is approximately inner (with unitaries in `A⁺`) iff it acts trivially on K₀.
*Needs:* §1.5, §2.3, §2.5; OperatorKTheory K1 (`Σ`, `K₀(A⊗K)`); HilbertModules H4.

**Checks.**

- `M₂` and `M₃` have invariants `(ℤ,ℕ,{0,1,2})` and `(ℤ,ℕ,{0,1,2,3})`: same ordered group,
  different scales, not isomorphic, stably isomorphic.
- `ℂ⊕ℂ` and `M₂` have invariants `(ℤ²,ℕ²,[0,(1,1)])` and `(ℤ,ℕ,[0,2])`: different ordered
  groups, not stably isomorphic.
- Injectivity: the map `ℂ⊕ℂ→ℂ`, `(z,w)↦z`, has `K₀`-map `(a,b)↦a`, which sends
  `(0,1)∈Σ(ℂ⊕ℂ)` to 0; the map is not injective. The map `ℂ→M₂`, `z↦diag(z,0)`, sends `1↦1≠0`
  and is injective.
- Uniqueness with unitaries in `B⁺` is needed for nonunital B: the two maps `ℂ→K` of §1.1
  have the same `K₀`-map `1↦1` and are conjugate by a unitary of `K⁺` (a finite permutation),
  not by any unitary of K, which has none.

### Examples

The CAR algebra (invariant `(ℤ[1/2],ℤ[1/2]≥0,1)`), the compact operators K (invariant
`(ℤ,ℕ,ℕ)`), `K⁺`, `M₂⊕ℂ` and the Fibonacci algebra of §2.2.

### Dependencies

Layer 1; CStarAlgebras C1, C5; HilbertModules H3–H4; OperatorKTheory K1–K3; Bratteli (Theorems
2.2 and 3.3), Rørdam (§§1.2–1.4, §2.3), Blackadar (Chapter 7).

## Layer 3: Dimension groups, scales, traces and UHF algebras (CL3)

### 3.1 Dimension groups

Define, on a partially ordered abelian group G with translation-invariant order,
`HasRieszInterpolation G` (whenever `aᵢ≤bⱼ` for `i,j∈{1,2}` some c satisfies `aᵢ≤c≤bⱼ` for all
i, j), `IsUnperforated G` (`n•g≥0` with `n≥1` implies `g≥0`) and `IsDimensionGroup G`
(directed, unperforated, with interpolation), as in `Suggested.lean` (Rørdam, §1.4;
Goodearl–Wehrung, §3). Define positive additive maps (monotone group homomorphisms), ordered
isomorphisms, order units, and order ideals (directed subgroups hereditary in the positive
cone). Develop cones, quotients by order ideals, positive direct limits, exactness, and the
Riesz decomposition of positive sums (`0≤g≤a+b` with `a,b≥0` gives `g=g₁+g₂` with
`0≤g₁≤a`, `0≤g₂≤b`), proving its equivalence with interpolation for directed groups. Prove that
an unperforated group is torsion-free. Do not impose Archimedeanness and do not rule out
infinitesimals. *Needs:* Mathlib `IsOrderedAddMonoid`, `IsDirected`, `Monotone`.

**Checks.**

- `ℤ` with its usual order is a dimension group; `ℤ²` with the strict-quadrant cone
  `{(a,b) : a>0, b>0}∪{0}` is directed and unperforated but fails interpolation: with
  `a₁=(0,0)`, `a₂=(1,−1)`, `b₁=(2,1)`, `b₂=(3,1)` all four inequalities hold, while an
  interpolant must be `(2,1)` from `a₂≤c≤b₁` and `(3,1)` from `a₂≤c≤b₂`.
- `ℤ` with cone `{0}∪{n : n≥2}` is directed (`max(a,b)+2` dominates a and b) but perforated:
  `2·1≥0` while `1≱0`; it also fails interpolation (`a₁=0`, `a₂=1`, `b₁=3`, `b₂=4` admit no
  interpolant, since `c≥1` and `c≤3` force `c=3` while `c≤4` then fails).
- Torsion-freeness: in an unperforated group `n•g=0` with `n≥1` gives `g≥0` and `−g≥0`, hence
  `g=0`; `ℤ/2` with the trivial order (cone `{0}`) has `2•1=0≥0` and `1≱0`, so it is perforated,
  consistent with its torsion.
- `ℚ⊕ℤ` with cone `{(r,n) : r>0}∪{0}` has interpolation: for strict inequalities take
  `c=(t,0)` with `max rᵢ<t<min sⱼ`, and when some `aᵢ=bⱼ` take `c=aᵢ`; it is a simple dimension
  group with the nonzero infinitesimal `(0,1)`.

### 3.2 The Effros–Handelman–Shen theorem

Define `SimplicialPresentation G` as in `Suggested.lean`: ranks `rₙ`, positive bonding maps
`ℤ^(rₙ)→ℤ^(rₙ₊₁)` (not required to be injective), compatible positive maps `βₙ:ℤ^(rₙ)→G` whose
images exhaust G, whose images of `ℕ^(rₙ)` exhaust `G⁺`, and whose kernels are the eventual
kernels of the system; `bondIter` is the composite bonding map between two stages. Prove
`effros_handelman_shen`: G is a countable dimension group iff it admits a simplicial
presentation (Goodearl–Wehrung, Theorem 3.3, citing Effros–Handelman–Shen, Theorem 2.2; Rørdam,
Theorem 1.4.4). The limit direction holds for every presentation and forces countability. For
the converse supply the finite positive-factorization construction: for a positive map
`f:ℤ^r→G` and `x∈ker f`, construct positive maps `α:ℤ^r→ℤ^s` and `β:ℤ^s→G` with `βα=f` and
`α(x)=0` (Goodearl–Wehrung, Triangle Lemma, §3), proving it from interpolation and
unperforation; iterate it over an enumeration of the elements, positive elements and relations
of G to build the system. The theorem assumes no presentation as extra input. *Needs:* §3.1;
Mathlib `AddMonoidHom`, `Countable`.

**Checks.**

- `G=0`: `IsDimensionGroup 0` holds and the presentation with all ranks 0 satisfies every
  field, including the eventual-kernel condition (every element of `ℤ⁰` is 0).
- `G=ℚ`: the presentation with rank 1, bonding map multiplication by `n+1` at stage n, and
  `βₙ(x)=x/n!` exhausts ℚ and `ℚ≥0` and has injective bonding maps; `G=ℝ` is a dimension group
  with no presentation, since the union of countably many images of `ℤ^(rₙ)` is countable.
- `ℤ` with cone `{0}∪{n≥2}` has no presentation: if `1=βₙ(x)`, then `2=β_m(y)` with `y≥0`
  by exhaustion of the cone, so `2x−y` (at a common stage) dies at a later stage, where
  `2x'=y'≥0` forces `x'≥0` in `ℤ^r` and hence `1=β(x')≥0`, a contradiction.
- The factorization lemma on `G=ℤ`, cone `{0}∪{n≥2}`, `f(a,b)=2a+3b`, `x=(3,−2)`: `α(x)=0`
  with α positive forces `α(e₁)=2w`, `α(e₂)=3w` for a positive w, and then `β(w)=1∉G⁺`; no
  factorization exists, so the dimension-group hypothesis is necessary. On `G=0` with `r=0`
  the factorization is trivial with `s=0`.

### 3.3 Scales and the scaled range theorem

A scale `Σ⊆G⁺` contains 0, is upward directed, is hereditary in `G⁺`, and generates `G⁺` by
finite sums (Rørdam, Definition 1.4.1). For interpolation groups prove the equivalent domination
form: each `g∈G⁺` is bounded above by a finite sum of elements of Σ (Riesz decomposition turns
`g≤s₁+s₂` into `g=g₁+g₂` with `gᵢ≤sᵢ`, so `gᵢ∈Σ`). Establish the scaled range theorem: every
countable dimension group with a scale is `(K₀(A),K₀(A)⁺,Σ(A))` for an AF algebra A, unique up
to isomorphism by §2.6 (Rørdam, Theorem 1.4.4 and Proposition 1.4.5; Blackadar, Theorem 7.4.1).
Build finite-dimensional blocks and connecting multiplicities from a simplicial presentation,
choosing the units of the blocks to realize exactly the prescribed scale. An order unit u gives
the unital scale `[0,u]`; the full positive cone gives a stable realization. Include the zero
group and the zero algebra. *Needs:* §2.2, §2.6, §3.2; OperatorKTheory K1.

**Checks.**

- In `ℤ`: `{0,1,2}` is a scale (it is `Σ(M₂)`); `{0,1,3}` is not hereditary (`2≤3` is missing);
  `ℕ` is the scale `Σ(K)`; `{0}` is a scale only for `G⁺=0`.
- The scale `[0,(1,1)]` on `ℤ²` is realized by `ℂ⊕ℂ`; the scale `[0,(1,0)]∪[0,(0,1)]`, which is
  not upward directed, is not a scale and is realized by no algebra.
- `G=0` with `Σ={0}` is realized by the zero algebra; `G=ℤ[1/2]` with `Σ=[0,1]` by the CAR
  algebra and with `Σ=ℤ[1/2]≥0` by `CAR⊗K`.

### 3.4 Ideals, simplicity and traces

Identify the lattice of closed ideals of an AF algebra with the lattice of order ideals of its
K₀ group (Bratteli, Theorem 3.3; Rørdam, §1.5). Prove that the inclusion `I⊆A` identifies
`K₀(I)` with its image, an order ideal, and identify `K₀(A/I)` as the quotient, with scales.
Prove that a nonzero AF algebra is simple iff every nonzero positive element of K₀ is an order
unit. Develop the state space `S(G,u)` of positive additive maps `G→ℝ` with `u↦1` under
pointwise convergence; prove it compact Hausdorff and functorial under positive unital maps. For
unital AF algebras prove that the trace pairing is an affine homeomorphism `T(A)≅S(K₀(A),[1])`,
constructing traces directly from compatible finite-stage matrix traces (no quasitrace-to-trace
theorem is needed) (Rørdam, §1.5; Blackadar, §6.9). For simple unital AF algebras identify
`K₀(A)⁺` with zero together with the elements strictly positive on every state. *Needs:* §2.3,
§2.6, §3.1; OperatorKTheory K1.

**Checks.**

- `K` has K₀ group ℤ, whose order ideals are `0` and `ℤ`, matching its closed ideals `0` and `K`;
  `K⁺` has `K₀=ℤ²` with `[e]=(1,0)` for a rank-one projection, `[1]=(0,1)`, `[1−e]=(−1,1)` and
  cone `{(a,b) : b>0}∪{(a,0) : a≥0}`; its order ideals are `0`, `ℤ⊕0` and `ℤ²`, matching `0`,
  `K`, `K⁺`, and `0⊕ℤ` is not an order ideal since `0≤(−1,1)≤(0,1)` with `(−1,1)∉0⊕ℤ`.
- The CAR algebra is simple: every nonzero `g∈ℤ[1/2]≥0` is an order unit, since `2ⁿg≥1` for
  some n; `ℂ⊕ℂ` is not, since `(1,0)` is not an order unit.
- In `ℚ⊕ℤ` of §3.1 with order unit `(1,0)` the unique state is `(r,n)↦r`, because
  `(r,±1)≥0` for all `r>0` forces `s(0,1)=0`; the elements `(1/2,0)` and `(1/2,1)` lie in the
  scale `[0,(1,0)]` (`(1,0)−(1/2,1)=(1/2,−1)≥0`), take the same state value `1/2`, and are
  distinct, so trace values alone do not determine projection equivalence in the realizing AF
  algebra.
- `T(CAR)` is a point, matching the unique state of `(ℤ[1/2],1)`.

### 3.5 UHF algebras and Glimm's classification

Define `UHFPresentation A` as in `Suggested.lean`: an increasing sequence of unital
C*-subalgebras of a unital C*-algebra A, each *-isomorphic to a full matrix algebra `M_(dₙ)`,
with dense union; since the stages are unital subalgebras, `dₙ∣dₙ₊₁`. Define the supernatural
invariant `supernaturalOfSizes d = ⨆ₙ Supernatural.ofNat(dₙ)` (Glimm, Definition 1.3). Prove
presentation independence and the normalized ordered-group formula
`(K₀(A),K₀(A)⁺,[1])=(Q_ν,Q_ν∩ℚ≥0,1)` with `Q_ν={a/b : a∈ℤ, b∈ℕ+, ofNat(b)≤ν}`, proving `Q_ν` is
an additive subgroup; the stabilization coordinates send a rank-one projection of `M_d` to
`1/d`. Prove `exists_uhf` (every supernatural number is the invariant of a UHF algebra),
`glimm_classification` (two UHF algebras are *-isomorphic iff their invariants agree; Glimm,
Theorem 1.12) and `uhf_unital_embedding_iff` (a unital *-homomorphism `A→B` exists iff
`ν_A≤ν_B`; necessity by Glimm, Theorem 1.13, second statement, sufficiency by intertwining
unital matrix embeddings through §1.2 and §1.5). Prove that tensor products multiply the
invariants, that stable isomorphism is equivalent to `qQ_ν=Q_μ` for some positive rational q,
and that every UHF algebra is simple with a unique trace. Compute the finite matrix algebras,
the CAR algebra of type `2^∞`, the universal UHF algebra of type `∏p^∞`, their tensor products
and K-theory. Apply the invariant computation to OperatorAlgebraDynamics D8's matrix-limit
presentation of the CAR algebra to identify its scaled ordered K₀ as `(ℤ[1/2],ℤ[1/2]≥0,1)`.
*Needs:* Tau Ceti `TauCeti.Supernatural` (`ofNat`, `ofNat_le_ofNat_iff`, `ofNat_mul`,
`iSup_apply`); §1.2, §1.5, §2.6, §3.3; OperatorAlgebraDynamics D8; OperatorKTheory K1.

**Checks.**

- A constant presentation with every stage `M_d` has invariant `ofNat d`; for `d=1` this is
  `ofNat 1=1=⊥`, the invariant of ℂ.
- Sizes `2ⁿ` give the invariant `2^∞` (exponent ⊤ at 2, 0 elsewhere); sizes `n!` give ⊤, the
  universal UHF algebra; sizes `2ⁿ` and `3ⁿ` give incomparable invariants, and neither of `M_(2^∞)`,
  `M_(3^∞)` embeds unitally in the other, since a unital copy of `M₂` cannot lie in a unital
  inductive limit of `M_(3ᵏ)` (Glimm, Lemma 1.11).
- `M₂` embeds unitally in `M₆` and not in `M₃`, matching `ofNat 2≤ofNat 6` and
  `ofNat 2≰ofNat 3`; the CAR algebra does not embed unitally in `M₂` (its invariant is not
  `≤ofNat 2`), and `M₂` embeds unitally in the CAR algebra as the first tensor factor.
- `Q_(2^∞)=ℤ[1/2]`, `Q_⊤=ℚ`, `Q_(ofNat 6)=(1/6)ℤ`; the rank-one projection of `M₆` has class
  `1/6`, and `M₂⊗M₃≅M₆` matches `ofNat 2·ofNat 3=ofNat 6`.
- `M₂(CAR)≅CAR` since `ofNat 2·2^∞=2^∞`, while `M₃(CAR)≇CAR` since `ofNat 3·2^∞≠2^∞`; the
  latter two are stably isomorphic since `3ℤ[1/2]` and `ℤ[1/2]` differ by the rational
  factor 3, as the stable-isomorphism criterion requires.

### Examples

`ℤ`, `ℤ[1/2]`, `ℚ`, `ℚ⊕ℤ` with the infinitesimal cone, the Fibonacci group of §2.2; the UHF
algebras `M_(2^∞)` (CAR), `M_(3^∞)`, the universal UHF algebra, and the finite matrix algebras.

### Dependencies

Layers 1–2; Tau Ceti `TauCeti.Supernatural`; OperatorKTheory K1; OperatorAlgebraDynamics D8;
Goodearl–Wehrung (§3), Glimm (§1), Bratteli (Theorem 3.3), Rørdam (§§1.4–1.5), Blackadar
(Theorem 7.4.1).

## Layer 4: Pure infiniteness and projection comparison (CL4)

### 4.1 Cuntz subequivalence

For positive `a,b∈A` define Cuntz subequivalence `a≼b` by the existence of `xₙ∈A` with
`xₙ*bxₙ→a` in norm (Rørdam, §4.1). Use the preorder on the positive-element subtype and
`AntisymmRel` for mutual subequivalence, with the relation written out rather than a second
order notation; it is not the spectral order on positive elements. Develop reflexivity,
transitivity, the cutdown estimates (`(a−ε)₊≼a`, and `a≼b` whenever `‖a−b‖<ε` gives
`(a−ε)₊≼b`), functoriality under *-homomorphisms and compatibility with hereditary
subalgebras. Define the stabilized relation in `A⊗K` and compare finite matrix representatives.
For projections prove equivalence with Murray–von Neumann subequivalence: `p≼q` iff some v has
`v*v=p` and `vv*≤q`. A complete Cuntz-semigroup classification theory is outside this roadmap.
*Needs:* Mathlib `AntisymmRel`, continuous functional calculus, `IsStarProjection`;
CStarAlgebras C1 (hereditary subalgebras).

**Checks.**

- In `ℂ`: `a≼b` iff `b≠0` or `a=0`, so `1≼2` and `2≼1` (take `xₙ=√2`, respectively
  `xₙ=1/√2`); mutual subequivalence identifies all nonzero positive scalars and is coarser
  than equality.
- In `M₂`: `diag(1,0)≼diag(0,1)` by the flip, and `1≼diag(1,0)` fails, since `x*px` has rank
  at most 1 and the rank-one matrices are norm closed away from the invertibles.
- Projections: `p≼q` with `p=diag(1,0)`, `q=diag(0,1)` in `M₂` is realized by `v=e₂₁`
  (`v*v=p`, `vv*=q`); the cutdown `(a−ε)₊` for `a=diag(1,1/2)` and `ε=3/4` is `diag(1/4,0)`,
  which is `≼a` and has strictly smaller support.

### 4.2 Infinite and properly infinite projections

A projection p is infinite if it is equivalent to a proper subprojection of itself, and
properly infinite if it contains two orthogonal subprojections each equivalent to p (Rørdam,
§4.1). Prove the matrix formulation `p⊕p≼p` of proper infiniteness, permanence under
equivalence and under the corners `qAq` with `q≥p`, and repeated splitting into finitely or
countably many orthogonal equivalent subprojections. Keep nonzeroness explicit: an infinite
projection is nonzero, while `p⊕p≼p` also holds for `p=0`. *Needs:* §4.1; Mathlib
`IsStarProjection`.

**Checks.**

- In `B(ℓ²)` the unit is properly infinite (the unilateral shifts to even and odd coordinates
  give two orthogonal copies); in `M_n` no nonzero projection is infinite, by rank.
- `p=0` satisfies `p⊕p≼p` and is not infinite; this is why nonzeroness is stated separately.
- A properly infinite projection is infinite (`p∼p₁<p`), and the converse fails in general:
  the unit of the Toeplitz algebra T is infinite (`S*S=1`, `SS*=1−e₀₀`) but not properly
  infinite, since `K₀(T)=ℤ` with cone ℕ and `[1]=1`, and two orthogonal subprojections
  equivalent to 1 would give their complement the class `−1∉ℕ`.

### 4.3 Purely infinite simple algebras

For a nonzero simple A, define pure infiniteness by the condition that every nonzero
hereditary C*-subalgebra contains an infinite projection (Rørdam, §4.1).
Prove the equivalences: with `A≄ℂ` together with "for all nonzero positive a, b there is x with
`x*ax=b`"; and with absence of characters together with `b≼a` for every nonzero positive a and
every positive b. Establish real rank zero, proper infiniteness of every nonzero projection, and
approximate units of projections. Prove invariance under nonzero hereditary subalgebras, full
corners, stabilization and strong Morita equivalence, and permanence under nonzero sequential
inductive limits of simple purely infinite algebras, stating nonzeroness of the limit separately
when connecting maps may vanish. *Needs:* §4.1, §4.2; CStarAlgebras C1; HilbertModules H3–H4.

**Checks.**

- `ℂ` is simple and not purely infinite (its only hereditary subalgebras are `0` and ℂ, and 1
  is finite); the condition `A≄ℂ` in the second characterization is exactly what excludes it,
  since in ℂ every nonzero positive a reaches every positive b by `x*ax=b`.
- `K` is simple and not purely infinite: every projection is finite-rank, hence finite.
- `O₂` is purely infinite simple (§4.6); its corner `pO₂p` for any nonzero projection p is
  again purely infinite simple and in fact isomorphic to `O₂` (§4.6, §5.8).
- An inductive limit of `O₂` along zero connecting maps is 0: the nonzeroness clause for limits
  is not automatic.

### 4.4 The slice lemma and Kirchberg's tensor criterion

Prove the slice lemma: a nonzero hereditary subalgebra D of `A⊗min B` contains `zz*` for some
nonzero z with `z*z=a⊗b`, a and b positive (Rørdam, §4.1), including the
positive-element compression and hereditary-transfer lemmas in its proof. Prove Kirchberg's
tensor criterion: for simple A, B, if A is not stably finite and B is not of type I
(HilbertModules H3: some irreducible image does not contain the compact operators), then
`A⊗min B` is simple and purely infinite (Rørdam, §4.1). Supply the non-type-I
matrix-compression construction used with the slice lemma, and handle elementary simple
algebras (`K(H)`) by stabilization. Obtain the tensor permanence results used for O₂ and O∞
absorption in Layer 6. *Needs:* §4.1–§4.3; CStarAlgebras C5 (minimal tensor products);
HilbertModules H3.

**Checks.**

- `A=O₂`, `B=ℂ`: B is type I, and `O₂⊗ℂ=O₂` is purely infinite anyway; the criterion is
  sufficient, not necessary.
- `A=O₂`, `B=K`: `O₂⊗K` is purely infinite simple (stabilization, §4.3), and B is type I, so
  again only sufficiency is tested.
- `A=K`, `B=CAR`: A is stably finite, and `K⊗CAR≅CAR⊗K` is stably finite, hence not purely
  infinite, so the non-stably-finite hypothesis cannot be dropped.
- `A=O₂`, `B=CAR`: B is not type I (it is simple and infinite-dimensional), so `O₂⊗CAR` is
  purely infinite simple; this is the case used for absorption.

### 4.5 Projections and unitaries in purely infinite simple algebras

Prove that full properly infinite projections with the same K₀-class are equivalent, including
stabilization and corner transport (Rørdam, §4.1; Phillips, §1). For purely
infinite simple A every K₀-class is represented by a nonzero projection in A, and two nonzero
projections are equivalent iff their classes agree; hence `K₀(A)⁺=K₀(A)`, whose order is not a
partial order unless the group is 0, and a nonzero projection may have class 0. For unital
purely infinite simple A prove `U(A)/U(A)₀≅K₁(A)` with a norm-continuous path description of
`U(A)₀` (Rørdam, §4.1; Phillips, §1). Build the projection-splitting and unitary-homotopy
lemmas these assertions need. Prove Zhang's dichotomy: a separable purely infinite simple
algebra is either unital or stable (Rørdam, §4.1). *Needs:* §4.2, §4.3;
OperatorKTheory K1–K2; HilbertModules H4.

**Checks.**

- In `O₂`, `K₀=0`: every nonzero projection is equivalent to 1, in particular `s₁s₁*∼1`, a
  nonzero projection of class 0.
- In `O₃`, `K₀=ℤ/2`: `1` and `s₁s₁*` have the same class (`[1]=3[s₁s₁*]=[s₁s₁*]`) and are
  equivalent; `s₁s₁*+s₂s₂*` has class `2[1]=0≠[1]` and is not equivalent to 1.
- `K₀(A)⁺=K₀(A)` is not a partial order for `A=O∞` (`K₀=ℤ`, every class positive, so
  `1≤−1≤1`); it is one for `O₂` with the zero group.
- Zhang: `O₂` is unital and not stable; `O₂⊗K` is stable and nonunital; `O₂⊕O₂⊗K` is neither
  but also not simple.

### 4.6 Cuntz algebras and corner embeddings

Use the universal models of `O_n` from OperatorAlgebraDynamics D6 and of `O∞` from
OperatorKTheory K7. Reuse D6's simplicity of finite `O_n`, prove their pure infiniteness, and
prove simplicity and pure infiniteness of `O∞` (Rørdam, §4.2). Nuclearity and K-theory are
supplied by the owning roadmaps. Prove that a nonzero projection p admits a unital embedding
`O∞→pAp` iff p is properly infinite, and that if p is also full with `[p]=0` there is a unital
embedding `O₂→pAp` (Rørdam, §4.2). Distinguish an embedding into the
corner from a unital embedding into A. *Needs:* §4.2, §4.5; OperatorAlgebraDynamics D6;
OperatorKTheory K7.

**Checks.**

- `p=1` in `O∞`: properly infinite (two isometries with orthogonal ranges), so `O∞→O∞` unital,
  the identity; `[1]=1≠0` in `K₀(O∞)=ℤ`, and indeed no unital embedding `O₂→O∞` exists, since
  it would force `[1]=2[1]`.
- `p=1` in `O₂`: `[1]=0` and 1 is full and properly infinite, giving the unital embedding
  `O₂→O₂`.
- `p=s₁s₁*+s₂s₂*` in `O₃`: properly infinite with class 0 in `ℤ/2` (§4.5), so `O₂` embeds
  unitally in `pO₃p`, while `[1_(O₃)]≠0` and `O₂` does not embed unitally in `O₃`.
- `p=diag(1,0)` in `M₂`: not properly infinite, no embedding of `O∞` into `pM₂p=ℂ`.

### Examples

`O₂`, `O₃`, `O∞`, their corners, `B(ℓ²)`, the Toeplitz algebra, `K`, `CAR`, and the tensor
products `O₂⊗CAR`, `K⊗CAR`.

### Dependencies

Mathlib; CStarAlgebras C1, C5; HilbertModules H3–H4; OperatorKTheory K1–K2, K7;
OperatorAlgebraDynamics D6; Rørdam (§§4.1–4.2), Phillips (§1).

## Layer 5: Sequence algebras, O₂ uniqueness and exact embedding (CL5)

### 5.1 Sequence algebras and ultrapowers

Reuse CStarAlgebras C5's bounded product `ℓ∞(A)` and norm-null ideal `c₀(A)`. Construct
`A∞=ℓ∞(A)/c₀(A)` with the diagonal inclusion and the quotient-norm formula
`‖[(aₙ)]‖=limsup ‖aₙ‖`. For a free ultrafilter ω on ℕ construct `Aω=ℓ∞(A)/{(aₙ) : limω‖aₙ‖=0}`
with the ultralimit norm formula `‖[(aₙ)]‖=limω‖aₙ‖` (Kirchberg–Phillips, Lemma 2.2;
Rørdam, Chapter 6). These are norm sequence algebras, distinct from tracial von Neumann
ultrapowers. Develop bounded representatives, functoriality, relative commutants and diagonal
reindexing. Prove projection lifting and, for unital A, unitary and isometry lifting in these
quotients. Prove that `Aω` is purely infinite simple when A is unital purely infinite simple,
using uniform comparison estimates rather than only pointwise simplicity (Rørdam, Chapter 6).
*Needs:* CStarAlgebras C5; §4.3; Mathlib `Filter.Ultrafilter`.

**Checks.**

- The constant sequence `(a)` has norm `‖a‖` in both `A∞` and `Aω`; the sequence `(1/n)` is 0
  in both.
- `(aₙ)` with `aₙ=1` for even n and 0 for odd n has norm 1 in `A∞` (limsup) and norm 1 or 0 in
  `Aω` according as ω contains the even or the odd integers: the two quotients differ.
- Projection lifting: a projection of `A∞` represented by self-adjoints `pₙ` with
  `‖pₙ²−pₙ‖→0` lifts to projections `χ_(1/2,∞)(pₙ)` for large n by functional calculus, since
  the spectrum of `pₙ` eventually avoids a neighborhood of `1/2`.
- Unitary lifting is of classes, not of chosen representatives: the sequence `((1−1/n)uₙ)`
  with `uₙ=diag(1,e^(i/n))` represents a unitary of `(M₂)∞` and no entry is unitary; the
  polar parts `uₙ` of its eventually invertible entries are the unitary lift.

### 5.2 Exact implementation in sequence algebras

For separable A and unital B, prove that approximate unitary equivalence of maps `A→Bω`
(unitaries of `Bω`) is implemented exactly by a single unitary of `Bω`, by a diagonal choice of
unitaries along a dense sequence (Kirchberg–Phillips, Lemma 1.12; Rørdam, Chapter 6). Prove the converse transfer: two maps `A→B` whose diagonal images in
`Bω` are unitarily equivalent are approximately unitarily equivalent in B. Include the lifting
and diagonal-choice arguments and distinguish an exact map into the quotient from its
approximately multiplicative completely positive representatives. *Needs:* §1.1, §5.1.

**Checks.**

- For `A=ℂ` the statement is that two projections of `Bω` which are approximately unitarily
  equivalent are unitarily equivalent, which holds since the distance between the orbits is 0
  and unitary equivalence of projections is closed under limits of implementing unitaries in
  `Bω` (diagonal choice).
- The converse for `B=M₂` and the two maps `ℂ→M₂` of §1.1 with the same multiplicity: their
  diagonal images are unitarily equivalent in `(M₂)ω` by the constant unitary, and the maps are
  unitarily equivalent in `M₂`.
- Representatives: the map `ℂ→(M₂)ω` sending 1 to the class of `(pₙ)` with `pₙ=diag(1,1/n)`
  is a *-homomorphism although no `pₙ` is a projection.

### 5.3 O₂ uniqueness and `O₂⊗O₂≅O₂`

For unital purely infinite simple B prove that any two unital maps `O₂→B` are approximately
unitarily equivalent (Kirchberg–Phillips, Proposition 0.7; Rørdam, Chapter 6). Develop the
inputs: bounded exponential length and `K₁`-injectivity of B, so that unitaries in `U(B)₀` are
products of self-adjoint exponentials with a uniform bound on the sum of their norms (Phillips,
§1). For a Cuntz pair `t₁,t₂` put `γ(b)=t₁bt₁*+t₂bt₂*`; prove that for every unitary u and
`ε>0` there is a unitary v with `‖vγ(v*)−u‖<ε`, and apply it to the unitary comparing the images
of two generating Cuntz pairs. Construct asymptotically central unital endomorphisms of `O₂` and
prove `O₂⊗O₂≅O₂` with approximate inner half-flip: the two factor embeddings `O₂→O₂⊗O₂` are
approximately unitarily equivalent (Rørdam, Chapters 5 and 7). These results precede the
classification theorem. *Needs:* §4.5, §4.6, §5.2; OperatorAlgebraDynamics D6; OperatorKTheory
K2, K7.

**Checks.**

- Two unital maps `O₂→O₂` given by the Cuntz pairs `(s₁,s₂)` and `(s₂,s₁)` are approximately
  unitarily equivalent, and in fact unitarily equivalent by `u=s₁s₂*+s₂s₁*`.
- The statement fails for `B=M₂`: no unital map `O₂→M₂` exists at all (an isometry of `M₂` is a
  unitary, so `s₁s₁*+s₂s₂*=2≠1`); pure infiniteness is what makes the theorem nonvacuous.
- For `u=1` the unitary `v=1` satisfies `vγ(v*)=γ(1)=1`; for `u=−1`, `v` must satisfy
  `vγ(v*)≈−1`, which has a solution since `K₁(O₂)=0` makes `−1∈U(O₂)₀`.

### 5.4 Completely positive comparison tools

Build the finite-dimensional completely positive comparison tools of Kirchberg–Phillips §1:
excise a state of a unital purely infinite simple algebra on a prescribed finite set by a
nonzero projection; dilate a u.c.p. map `M_n→B`, B unital properly infinite, to `x↦t*π(x)t` for
an isometry t and a (possibly nonunital) *-homomorphism π (Kirchberg–Phillips, Lemma 1.14);
and approximate nuclear u.c.p. maps `B→B` by compressions with isometries when B is unital
purely infinite simple. Prove the approximate factorization lemma: if A is separable unital,
`φ₁:A→B₁` is a unital embedding, `φ₂:A→B₂` is unital, and `B₁,B₂` are separable unital with
`B₂` nuclear, then there are u.c.p. maps `ηₙ:B₁→B₂` with `ηₙφ₁(a)→φ₂(a)` for every a
(Kirchberg–Phillips, Proposition 0.4): `φ₂` is a nuclear map, so it approximately factors through
a matrix algebra, and the matrix-valued factor composed with `φ₁⁻¹` on `φ₁(A)` extends to `B₁`
by Arveson's extension theorem. No exactness of A is used. Prove the uniform matrix-level
version, which does use exactness of A: for separable unital exact A, a finite-dimensional
operator system `E⊂A` and `ε>0`, there are `δ<ε` and n such that whenever `V:E→B₁` and
`W:E→B₂` are u.c.p. with V injective and `‖V⁻¹⊗id_(M_n)‖≤1+δ`, some u.c.p. `T:B₁→B₂` has
`‖TV−W‖<ε` (Kirchberg–Phillips, Lemma 1.10); exactness enters through the nuclear embedding of
A into `B(H)`. Deduce the ultraproduct representative version with its finite matrix-level
inverse bounds, and, when `B₁=B₂` is a Kirchberg algebra, the corresponding isometric
compressions. *Needs:* CStarAlgebras C3–C4 (operator systems, Arveson extension, CP
dilations), C6–C7 (nuclearity, exactness); §4.5, §5.1.

**Checks.**

- `A=B₁=B₂=ℂ`: `φ₁=φ₂=id`, and `ηₙ=id` works; with `B₁=M₂`, `φ₁(z)=z1`, `B₂=ℂ`, `φ₂=id`,
  the compression `η(x)=x₁₁` is a u.c.p. map with `ηφ₁=φ₂` exactly.
- The factorization lemma makes no exactness demand: with `A=B₁` nonexact separable unital,
  `φ₁=id` and `φ₂:A→B₂` any unital map into a separable nuclear `B₂`, the constant choice
  `ηₙ=φ₂` is u.c.p. and satisfies `ηₙφ₁=φ₂` exactly.
- The matrix-level version is uniform: n and δ depend only on A, E and ε, not on `B₁`, `B₂`,
  V or W, whereas the pointwise lemma produces `ηₙ` from the given pair `φ₁`, `φ₂`; the
  uniformity is what the nuclear embedding `A⊆B(H)` of an exact A provides (Kirchberg–Phillips,
  proof of Lemma 1.10), and it is the only place exactness is cited in §5.4.
- Dilation in `B=O₂`: the u.c.p. map `M₂→O₂`, `x↦x₁₁1`, is `t*π(x)t` with `π(x)=∑xᵢⱼsᵢsⱼ*` and
  `t=s₁`.

### 5.5 The isometry-to-unitary comparison lemma

Prove the two-sided comparison lemma: if unital maps `φ,ψ:A→B₀` admit isometries in `B₀`
giving pointwise compressions from each map to the other, and `O₂` embeds unitally into
`B∩B₀′`, then φ and ψ are approximately unitarily equivalent in B (Kirchberg–Phillips, Lemma
1.12 and the proof of Theorem 1.15; Rørdam, Chapter 6). Construct the comparison projections
and the Cuntz-pair unitary explicitly. Deduce `O₂` uniqueness of embeddings: any two unital
embeddings of a separable unital exact A into `O₂` are approximately unitarily equivalent
(Kirchberg–Phillips, Theorem 1.15); more generally into `B⊗O₂` for B unital Kirchberg, and into
B simple separable unital nuclear using §4.4's tensor criterion. *Needs:* §4.4, §4.6, §5.3,
§5.4.

**Checks.**

- `A=ℂ`: two unital maps `ℂ→O₂` are equal, so the statement is trivial; `A=ℂ²`: two unital
  embeddings of `ℂ²` into `O₂` send `(1,0)` to nonzero projections `p`, `q` with `[p]=[q]=0`,
  which are equivalent by §4.5 with equivalent complements, hence the embeddings are
  unitarily equivalent.
- The hypothesis on `B∩B₀′` is sufficient, not necessary: with `B=B₀=M₂`, `O₂` does not embed
  unitally in `M₂` (§5.3), so the lemma makes no claim, while the two unital maps `ℂ²→M₂`
  sending `(1,0)` to `diag(1,0)` and to `diag(0,1)` are nevertheless unitarily equivalent.
- For `B` unital Kirchberg, `O₂` embeds unitally in `(B⊗O₂)∩(B⊗1)′` as `1⊗O₂`, which is why
  the `B⊗O₂` form follows from the lemma.

### 5.6 The exact embedding theorem

Prove Kirchberg's exact embedding theorem: a separable C*-algebra embeds into `O₂` iff it is
exact, with a unital embedding for nonzero unital A (Kirchberg–Phillips, Theorem 2.8;
Rørdam, Chapter 6). Necessity is exactness of subalgebras of the exact `O₂`
(CStarAlgebras C7, with nuclearity of `O₂` from OperatorAlgebraDynamics D6). For sufficiency,
prove the liftable sequence-algebra lemma: for separable unital exact A, a unital embedding
`A→(O₂)∞` with a u.c.p. lift `A→ℓ∞(O₂)` gives a unital embedding `A→O₂` by successive unitary
corrections (Kirchberg–Phillips, Lemma 2.2). Develop the quasidiagonal exact case: a separable
unital exact quasidiagonal algebra embeds unitally in `O₂` (Kirchberg–Phillips, Corollary 2.3),
using CStarAlgebras C8 and C9's cone theorem. Then remove quasidiagonality by the translation
crossed-product and lifting constructions of §5.7–§5.8. Retain the exact nonnuclear case: the
Choi–Effros lift for a nuclear domain alone does not prove the theorem. Check injectivity by
norm estimates at every stage and prove the unitalization and corner reductions. *Needs:*
§5.1–§5.5; CStarAlgebras C7–C9; OperatorAlgebraDynamics D6.

**Checks.**

- `C(S¹)` is exact and quasidiagonal (commutative), and embeds unitally in `O₂` by a unitary
  with full spectrum (§5.8); `A=ℂ` embeds as `ℂ1`.
- No separable nonexact algebra embeds in `O₂`, since subalgebras of the exact `O₂` are
  exact; the reduced C*-algebra of the free group `F₂` is exact and nonnuclear, and not
  quasidiagonal (Rosenberg: a quasidiagonal reduced group C*-algebra has amenable group), so it
  is the case for which the crossed-product argument of §5.7–§5.8 exists.
- The zero algebra embeds (as 0) and is excluded from the unital clause.

### 5.7 The tensor-criterion lifting lemma and the crossed-product lift

Establish the lifting lemma: for separable unital D, E with `D≠0` and a nuclear closed ideal
`J⊲E`, if a unital embedding `φ:D→E/J` has the property that its algebraic tensor map extends
continuously to `D⊗min B(ℓ²)→(E⊗min B(ℓ²))/(J⊗min B(ℓ²))`, then φ has a u.c.p. lift `D→E`
(Kirchberg–Phillips, Lemma 2.4). For a unital embedding φ the hypothesis `D≠0` is equivalent to
`J≠E`, since `φ(1)=1` is nonzero exactly when `E/J≠0`. Build the extension-of-CP-maps argument
using the tensor-kernel criterion for arbitrary coefficient algebras and the reduction to
separable subalgebras. Apply it to the crossed-product lifting problem: if D embeds unitally
into a separable unital nuclear E and `σ∈Aut(D)` is approximately inner in E, construct the
injective covariant map `D⋊σℤ→C(𝕋)⊗E∞` and a u.c.p. lift into `C(𝕋)⊗ℓ∞(E)` (Kirchberg–Phillips,
Lemmas 2.5–2.7), using the separable pullback algebra and the nuclear ideal `C(𝕋)⊗c₀(E)` to
apply the lemma. Verify the tensor-continuity hypothesis explicitly: use OperatorAlgebraDynamics
D2's identification of `(D⋊σℤ)⊗min B(ℓ²)` with `(D⊗min B(ℓ²))⋊(σ⊗id)ℤ` and the approximately
implementing unitaries `uₙ⊗1` to construct the tensor-level covariant map into the
corresponding quotient (Kirchberg–Phillips, Lemma 2.6), and identify it with the algebraic
tensor map on generators. *Needs:* §5.1; CStarAlgebras C5, C7; OperatorAlgebraDynamics D1–D2.

**Checks.**

- Negative control for `D≠0`: `D=0`, `E=J=ℂ` satisfy every other hypothesis (the zero map
  `0→0` is a unital embedding and both tensor quotients vanish), yet no linear map `0→ℂ` sends
  `1=0` to 1.
- For `J=0` the lemma says a unital embedding `D→E` has a u.c.p. lift, namely itself; the tensor
  hypothesis holds since `φ⊗id` is a *-homomorphism.
- For `D=E/J` nuclear the lemma recovers the Choi–Effros lift of the identity (CStarAlgebras
  C7); the tensor hypothesis is automatic for nuclear D.
- For `σ=id` on `D=ℂ` the crossed product is `C(𝕋)`, the covariant map is the identity on
  `C(𝕋)⊗1`, and the lift is the inclusion `C(𝕋)→C(𝕋)⊗ℓ∞(E)`, `f↦f⊗1`.

### 5.8 The translation crossed product and the end of the proof

For exact separable unital A take `D=(C₀(ℝ)⊗A)⁺` with the translation by 1 (trivial on A). Its
quasidiagonality comes from CStarAlgebras C9's cone theorem, since D is the unitization of a
subalgebra of the cone over A; embed D into `O₂` by §5.6's quasidiagonal case and apply §5.7's
lifting result with `O₂` uniqueness (Kirchberg–Phillips, Theorem 2.8). Identify `(C₀(ℝ)⊗A)⋊ℤ`
with `C(𝕋)⊗K⊗A` by the translation imprimitivity construction and locate its copy of A. For the
scalar case construct the Hilbert `C(𝕋)`-module from `C_c(ℝ)` with inner product
`⟨f,g⟩(x+ℤ)=∑ₙ conj(f(x+n))g(x+n)`; identify it with the sections of the `ℓ²(ℤ)` bundle with
shift monodromy, and trivialize this bundle by a norm-continuous unitary path from 1 to the
bilateral shift obtained from its bounded self-adjoint logarithm. This identifies its compact
operators with `C(𝕋)⊗K`; then tensor with A using the trivial action on the coefficient. The
crossed product is exact by OperatorAlgebraDynamics D2. Embed `C(𝕋)` unitally into `O₂` by a
unitary with full spectrum, and use `O₂⊗O₂≅O₂` coordinatewise to map `C(𝕋)⊗(O₂)∞` injectively
into `(O₂)∞`; prove injectivity using exactness of `C(𝕋)` and the sequence-quotient norm
formula, and transport the u.c.p. lift by the same coordinate maps. The resulting lift and
successive corrections embed the crossed product in `O₂`. Finally use equivalence of nonzero
projections in `O₂` (`K₀(O₂)=0`, §4.5) to identify the resulting corner with `O₂` and obtain a
unital embedding of A. This proof uses no classification theorem from Layers 7–8. *Needs:*
§4.5, §5.3, §5.6, §5.7; CStarAlgebras C9; OperatorAlgebraDynamics D2–D3; HilbertModules H3
(imprimitivity).

**Checks.**

- `A=ℂ`: `(C₀(ℝ))⋊ℤ≅C(𝕋)⊗K` is the scalar imprimitivity identification; its unit-corner copy
  of ℂ is a rank-one projection tensor 1.
- The bilateral shift has spectrum the whole circle, so its logarithm is chosen bounded on a
  cut circle; the resulting path `exp(it·log S)` from 1 to S is norm continuous, which is what
  trivializes the bundle.
- The copy of `C(𝕋)` in `O₂` given by `u=s₁s₂*+s₂s₁*` has spectrum `{±1}`, not the full circle;
  a unitary with full spectrum (for instance one obtained from a Cuntz-algebra model of the
  bilateral shift) is required for the embedding to be injective.

### Examples

`(O₂)∞`, `(O₂)ω`, the crossed product `C₀(ℝ)⋊ℤ≅C(𝕋)⊗K`, the cone over A, the reduced free
group C*-algebra as an exact nonquasidiagonal algebra embedded in `O₂`.

### Dependencies

Layers 1 and 4; CStarAlgebras C3–C9; HilbertModules H3; OperatorKTheory K2, K7;
OperatorAlgebraDynamics D1–D3, D6; Kirchberg–Phillips (§§0–2), Rørdam (Chapters 5–6), Phillips
(§1).

## Layer 6: Tensor absorption (CL6)

### 6.1 O₂ absorption

For every nonzero simple separable unital nuclear A prove `A⊗O₂≅O₂` (Rørdam, Chapter 7): use §5.6's embeddings and §5.5's uniqueness to construct
approximately inverse maps and apply §1.5's intertwining. Prove the stable version
`A⊗O₂≅O₂⊗K` for stable Kirchberg A. Nuclearity and simplicity are hypotheses of absorption;
exactness alone suffices only for §5.6's embedding theorem. *Needs:* §1.5, §4.4, §5.5, §5.6;
CStarAlgebras C5–C6.

**Checks.**

- `A=ℂ`: `ℂ⊗O₂=O₂`; `A=M_n`: `M_n(O₂)≅O₂`, consistent with §8.8 (`gcd(n,1)=1`).
- `A=C*_r(F₂)` is exact, simple and nonnuclear: it embeds in `O₂`, but `C*_r(F₂)⊗O₂` is not
  nuclear (nuclearity passes to the range of the slice-map conditional expectation onto
  `C*_r(F₂)⊗1`), hence is not `O₂`; nuclearity is needed.
- `A=ℂ²` is nuclear and not simple: `ℂ²⊗O₂=O₂⊕O₂≇O₂` (it is not simple); simplicity is
  needed.

### 6.2 Central-sequence absorption

Develop central-sequence absorption through the norm ultrapower relative commutant
`M(A)ω∩A′`, with A embedded diagonally in `M(A)ω`. For nonzero separable A and nonzero simple
separable unital nuclear D with approximately inner half-flip, prove that a unital embedding
`D→M(A)ω∩A′` implies `A≅A⊗D` (Rørdam, Chapter 7). Construct the
finite-set approximately central maps, the unitary corrections and the intertwining, using
multiplier representatives for nonunital A. If D is isomorphic to its infinite tensor power,
prove the converse. Do not replace the half-flip hypothesis by a claim that the full flip
automorphism of `D⊗D` is approximately inner without proving that stronger assertion.
*Needs:* §1.5, §5.1, §5.3; CStarAlgebras C1 (multiplier algebras), C5–C6.

**Checks.**

- `D=ℂ` has approximately inner half-flip trivially, and the statement reads `A≅A`.
- `D=M₂` has approximately inner half-flip (the two factor embeddings `M₂→M₄` are unitarily
  equivalent, §1.4); a unital embedding `M₂→M(A)ω∩A′` implies `A≅A⊗M₂`, which fails for
  `A=ℂ` and `A=O₃` (`gcd(2,2)≠gcd(1,2)` in §8.8), so no such embedding exists there, while for
  the CAR algebra it exists (tail tensor factors) and `CAR≅CAR⊗M₂`.
- `D=ℂ²` has no approximately inner half-flip (`(1,0)⊗1` and `1⊗(1,0)` have different
  central supports in `ℂ²⊗ℂ²`), and the conclusion would be false for `A=ℂ`.

### 6.3 O∞ uniqueness and absorption

Prove the `O∞` uniqueness theorem: any two unital maps from `O∞` into a unital purely infinite
simple algebra are approximately unitarily equivalent (Rørdam, Chapter 7;
Phillips, §2), including the finite-generator comparison and the passage from finite Cuntz
families to `O∞`. Construct the approximately inner half-flip of `O∞` and `O∞≅⊗ₙO∞`. Prove that
for nonzero separable A, `A≅A⊗O∞` iff `O∞` embeds unitally into `M(A)ω∩A′` for a free
ultrafilter (Rørdam, Chapter 7), and that for nonzero simple separable nuclear A these are
equivalent to pure infiniteness (Rørdam, Chapter 7).
Build the central isometries from pure infiniteness and nuclear approximation; this is an input
to classification, not a consequence of it. *Needs:* §4.3, §4.6, §5.3, §5.4, §6.2;
OperatorKTheory K7.

**Checks.**

- `O∞⊗O∞≅O∞` and `O₂⊗O∞≅O₂` (`O₂` is purely infinite simple nuclear); `O∞⊗O₂≅O₂` by §6.1.
- `A=CAR` is simple separable nuclear and not purely infinite, and `CAR⊗O∞≇CAR` since the
  right side is purely infinite; the equivalence with pure infiniteness is sharp.
- Two unital maps `O∞→O₂` are approximately unitarily equivalent; so are the two unital
  endomorphisms of `O∞` sending the generators to `(s₁,s₂,…)` and to `(s₂,s₃,…)`.

### 6.4 The finite-set criterion and inductive limits

For nonzero separable unital A give the finite-set form: `O∞` embeds unitally into `Aω∩A′` iff
for every finite `F⊂A` and `ε>0` the algebra A contains two isometries with orthogonal ranges
each commuting with F to within ε (Rørdam, Chapter 7). Prove it by lifting isometries
and a diagonal choice, using §4.2's proper-infiniteness criterion for the unit of `Aω∩A′`.
Deduce that `O∞` absorption passes to unital sequential inductive limits, by approximating finite
sets from a stage. Keep this unital argument distinct from the multiplier formulation for
nonunital A. *Needs:* §4.2, §5.1, §6.3; CStarAlgebras C5.

**Checks.**

- `A=O∞`: the criterion holds through an isomorphism `O∞≅O∞⊗O∞`, under which `1⊗s₁`, `1⊗s₂`
  commute exactly with `F⊗1`; the generators themselves do not serve, since
  `s₁*s_(n+1)=0≠s_(n+1)s₁*`.
- `A=M_n`: no two isometries have orthogonal ranges, so the criterion fails, and `M_n≇M_n⊗O∞`.
- The limit of `O∞→O∞⊗O∞→…` along first-factor embeddings absorbs `O∞`, by the finite-set
  criterion at a stage.

### 6.5 Absorption and KK

Relate tensor absorption to the scalar inclusion `ℂ→O∞` and its KK-equivalence from
OperatorKTheory K8: show that tensoring by `O∞` preserves the relevant KK-classes and
composition. This is a statement about KK, separate from the existence of an algebra
isomorphism. Prove the matrix and full-corner compatibilities needed to use absorption for
stable and unital Kirchberg algebras (Phillips, §2). *Needs:* §6.3; OperatorKTheory K5–K6, K8;
HilbertModules H4.

**Checks.**

- `KK(ℂ,O∞)=K₀(O∞)=ℤ` with the inclusion's class the generator, and `KK(O∞,ℂ)=Hom(ℤ,ℤ)=ℤ`;
  the KK-inverse of the inclusion is not induced by a *-homomorphism, since no unital map
  `O∞→ℂ` exists (an isometry of ℂ is 1, and two of them cannot have orthogonal ranges).
- Tensoring the identity class of `ℂ` with `O∞` gives the identity class of `O∞`, matching
  `ℂ⊗O∞=O∞`.
- For `A=O₂`, `KK(O₂,O₂)=0`, and `O₂⊗O∞≅O₂` preserves the zero class trivially.

### Examples

`O₂⊗CAR≅O₂`, `M_n(O₂)≅O₂`, `O∞⊗O∞≅O∞`, `CAR⊗O∞` (a Kirchberg algebra with invariant
`(ℤ[1/2],1,0)`, §8.8), `O₂⊕O₂` as a nonsimple negative control.

### Dependencies

Layers 1, 4 and 5; CStarAlgebras C1, C5–C6; HilbertModules H4; OperatorKTheory K5–K8; Rørdam
(Chapter 7), Phillips (§2).

## Layer 7: Full homomorphisms and KK uniqueness (CL7)

### 7.1 Full and image-full homomorphisms; Cuntz sums

A *-homomorphism `φ:A→B` is full when `φ(a)` generates B as a closed ideal for every nonzero
positive `a∈A`; for nonzero simple A and simple B this is equivalent to `φ≠0` (Phillips,
§1.2). Develop fullness under composition, corners, tensors, stabilization
and homotopy, with the hypotheses each operation requires; a homotopy need not consist of full
maps. Call φ image-full when the closed ideal generated by `φ(A)` is B. Prove that pointwise
fullness implies image-fullness for nonzero A, and the converse for simple A. Develop
image-fullness under composition, full corners and stabilization. For stable B use multiplier
isometries `s₁,s₂` with orthogonal ranges summing to 1 to define the Cuntz sum
`φ⊕ψ=Ad(s₁)φ+Ad(s₂)ψ`; prove independence of the isometries up to unitary equivalence in
`M(B)`, associativity, commutativity, and agreement with addition in KK (Phillips, §1).
*Needs:* CStarAlgebras C1; HilbertModules H4; OperatorKTheory K5.

**Checks.**

- `A=ℂ⊕ℂ`, `B=ℂ`, `φ(z,w)=z`: image-full (the image is ℂ) and not pointwise full, since
  `φ(0,1)=0`; this is the gap between the two notions for nonsimple sources.
- A nonzero map from a nonzero simple source to a simple target is full in both senses: `ℂ→O₂`
  and the inclusion `O₂→O₂⊗K`, `a↦a⊗e`.
- The zero map `A→B` with `B≠0` is neither full nor image-full; with `B=0` every map is both,
  so statements about full maps carry `B≠0` where they need it.
- In `B=O₂⊗K` the Cuntz sum of the inclusion `a↦a⊗e` with itself is unitarily equivalent to
  `a↦a⊗(e+e′)` for orthogonal rank-one `e,e′`, and its KK-class is twice the inclusion's.

### 7.2 Full asymptotic morphisms and Phillips's deformation theorem

Use OperatorKTheory K9's asymptotic morphisms. For unital simple A and an asymptotic morphism
`φ:A→B`, construct by functional calculus a continuous projection path `q_t` for large t with
`‖q_t−φ_t(1)‖→0`, and call φ full when `q_t` is a full projection of B for some large t
(Phillips, Definition 1.2.5). Prove independence of the tail projection and the time, since
continuity makes projection paths locally unitarily conjugate. For a separable source
containing a full projection p, define image-fullness of an asymptotic morphism by the same
condition on `φ_t(p)` and prove independence of p; constant morphisms recover image-fullness of
*-homomorphisms (the ideals generated by `φ(p)` and `φ(A)` agree), and for simple sources this
agrees with pointwise fullness. Homotopy is an asymptotic morphism into `C([0,1],B)` with
uniform-in-the-parameter defect estimates. Asymptotic unitary equivalence means a
norm-continuous path of unitaries in the minimal unitization of the target with
`‖u_tφ_t(a)u_t*−ψ_t(a)‖→0` (Phillips, §1). Prove Phillips's deformation theorem: for A
nonzero simple separable unital nuclear and `D₀` nonzero separable unital, full asymptotic
morphisms `A→K⊗O∞⊗D₀` are homotopic iff asymptotically unitarily equivalent, and each is
asymptotically unitarily equivalent to a full *-homomorphism (Phillips, Theorem 2.3.7 and
Corollary 2.3.10). Give the path constructions and estimates using Cuntz isometries, the `O₂`
shift homotopy and absorption; the replacement of an asymptotic morphism by a homomorphism is a
proved result, not part of the definition. Use K9's reparameterization to pass between `[1,∞)`
and `[0,∞)`. *Needs:* §1.1, §4.5, §5.3, §6.3, §7.1; OperatorKTheory K9; CStarAlgebras C6.

**Checks.**

- A constant asymptotic morphism given by a *-homomorphism `φ:A→B` with A unital has
  `q_t=φ(1)`, and is full iff `φ(1)` generates B as an ideal; for `B=O∞⊗K` every nonzero
  projection is full, so `ℂ→O∞⊗K`, `1↦e⊗1`, is full and the zero map is not.
- The negative control of §7.1 (`A=ℂ⊕ℂ`, `B=ℂ`, `φ(z,w)=z`, `p=(1,1)`): image-full as a
  constant asymptotic morphism, not pointwise full.
- Two asymptotic morphisms `ℂ→K⊗O∞` sending 1 to projections of classes 1 and 2 in
  `K₀(K⊗O∞)=ℤ` are not homotopic (homotopy preserves the `K₀`-class), hence not
  asymptotically unitarily equivalent; two with equal classes are both, by §4.5.

### 7.3 The homomorphism picture of KK

For A nonzero simple separable unital nuclear and D separable unital, form the Cuntz-sum group
of full homomorphisms `A→K⊗O∞⊗D` modulo asymptotic unitary equivalence along paths; construct
its zero from a full map factoring through `O₂`, and its inverses using the suspension and Bott
construction (Phillips, §§3–4). For nonunital D extend the functor by the kernel of its value on
`D⁺→ℂ`. Prove homotopy invariance, stability and half-exactness using quasicentral approximate
units and the path-quotient construction. Compare with the KK and E universal properties
(OperatorKTheory K6 and K9): construct the map on cycles and its inverse, show that homotopies
and degenerate cycles are respected, and identify the scalar-to-`O∞` KK-equivalence. Prove the
natural identification with `KK(A,D)`, with addition as Cuntz sum and the Kasparov product as
composition in the stabilized picture (Phillips, Theorems 4.1.1 and 4.1.3). This supplies the
existence theorem as well as uniqueness. *Needs:* §7.1, §7.2; OperatorKTheory K5–K6, K8–K9.

**Checks.**

- `A=ℂ`: the group is `K₀(K⊗O∞⊗D)=K₀(D)`, generated by classes of full projections, in
  agreement with `KK(ℂ,D)=K₀(D)`; for `D=ℂ` the inclusion `ℂ→K⊗O∞`, `1↦e⊗1`, is the
  generator 1.
- `D=O₂`: the group is `KK(A,O₂)=0`, so every full map `A→K⊗O∞⊗O₂≅K⊗O₂` is asymptotically
  unitarily equivalent to every other, matching §5.5 and §6.1.
- The zero element for `A=D=ℂ` is the class of the full projection `e⊗(1−s₁s₁*)` of
  `K⊗O∞`: it is nonzero (it dominates `e⊗s₂s₂*`), full since `O∞⊗K` is simple, and has class
  `[1]−[s₁s₁*]=0` because `s₁*s₁=1`; by §4.6 the corner it cuts out contains a unital copy of
  `O₂`, so the map factors through `O₂`. The zero projection is not full and does not
  represent the zero element.

### 7.4 The homomorphism theorem

Deduce the homomorphism theorem: if A is nonzero simple separable unital nuclear and B is
nonzero separable unital with `B≅B⊗O∞`, every `x∈KK(A,B)` is represented by a full map
`A→B⊗K`, and two full such maps have the same KK-class iff they are homotopic iff they are
asymptotically unitarily equivalent (Phillips, Theorems 4.1.1 and 4.1.3). Prove the stable-domain version for maps between stabilized Kirchberg algebras using full
corners and the compatible Kasparov product. For unital Kirchberg A, B obtain a unital
representative exactly when `x_*([1_A])=[1_B]` (Phillips, Theorem 4.1.3 and Corollary 4.2.2):
compress the stabilized image unit using §4.5's projection classification and prove that the
compression preserves the KK-class. *Needs:* §4.5, §6.3, §7.3; HilbertModules H4;
OperatorKTheory K6.

**Checks.**

- `A=B=O∞`: `KK(O∞,O∞)=ℤ` (UCT with free K-theory), the identity has class 1 and is unital; the
  class 2 is represented by a map `O∞→O∞⊗K` with image unit of class 2, which has no unital
  representative since `2≠1=[1]`.
- `A=O₂`, any B: `KK(O₂,B)=0`, the zero class is represented by any full map `O₂→B⊗K`, and all
  such maps are asymptotically unitarily equivalent.
- `A=B=O₃`: `K₀=ℤ/2` has only the identity automorphism, so every invertible class preserves
  `[1]` and has a unital representative; for `A=B=O∞` the invertible class acting by `−1` on
  `K₀=ℤ` sends `[1]=1` to `−1`, so it has no unital representative.

### 7.5 Intertwining with a retained KK-class

Strengthen §1.5's intertwining to retain a chosen KK-class: use the continuous implementing
paths of §7.2 to make the corrections through compatible homotopies on increasing finite sets,
and prove that the limit isomorphism is homotopic to the chosen initial stabilized map
(Phillips, §4). Point-norm convergence alone does not imply eventual equality of KK-classes;
include the uniform tail estimates for the homotopies and the inverse maps that supply this
stronger conclusion. *Needs:* §1.5, §7.2, §7.4; OperatorKTheory K6.

**Checks.**

- For the constant system `A_n=O∞` with identity maps and `φ_n=ψ_n=id` the limit isomorphism
  is the identity with class `1∈KK(O∞,O∞)=ℤ`.
- Point-norm convergence is not what fixes the class: the rotations of `C(S¹)` converge
  point-norm to the identity and all have its KK-class, while the orientation reversal
  `z↦conj(z)` acts by `−1` on `K₁` and is at point-norm distance 2 from every rotation; the
  retained class is tracked through the homotopies, not inferred from convergence.
- A homotopy of isomorphisms through full maps keeps the KK-class, so the limit of the
  corrected intertwining has the class of its initial map.

### Examples

The homomorphism groups `KK(ℂ,D)=K₀(D)`, `KK(O₂,B)=0`, `KK(O∞,O∞)=ℤ`, `KK(O₃,O₃)=ℤ/2` as
Cuntz-sum groups of full maps.

### Dependencies

Layers 1, 4–6; CStarAlgebras C1, C6; HilbertModules H4; OperatorKTheory K5–K6, K8–K9;
Phillips (Chapters 1–4).

## Layer 8: Classification, invariant range and examples (CL8)

### 8.1 Kirchberg–Phillips classification

Prove the Kirchberg–Phillips classification with realization of the specified invariant
(Phillips, Theorems 4.2.1 and 4.2.4; Corollary 4.2.2):

- For stable Kirchberg algebras A, B, an invertible `x∈KK(A,B)` is induced by a *-isomorphism
  `A→B`; conversely every isomorphism induces an invertible KK-class.
- For unital Kirchberg algebras the same holds exactly for invertible classes with
  `x_*([1_A])=[1_B]`.
- For Kirchberg algebras in the bootstrap UCT class, stable isomorphism is equivalent to an
  isomorphism of the graded groups `(K₀,K₁)`, with every specified group isomorphism realized;
  in the unital case retain `[1]` in the invariant and require its preservation. Apply
  OperatorKTheory K8's product-compatible lifting of a K-theory isomorphism to a
  KK-equivalence.

Use §4.5's unital-or-stable dichotomy for the remaining separable nonunital case. *Needs:* §4.5,
§7.4, §7.5; OperatorKTheory K8.

**Checks.**

- `O₂` is the unique unital UCT Kirchberg algebra with `K_*=0`; `O₂⊗K` the unique stable one.
- `O∞` and `O∞⊗K` are distinguished by unitality; `O∞` and `M₂(O∞)` by the unit class
  (`1≠2` in ℤ) although `KK(O∞,M₂(O∞))` contains invertibles.
- `O₃` and `M₂(O₃)` have unit classes `1` and `2=0` in `ℤ/2`, so are not isomorphic, while
  `O₃≅M₃(O₃)` since `3=1` in `ℤ/2`; see §8.8.

### 8.2 Automorphisms

Prove that for stable Kirchberg A the map `Aut(A)→KK(A,A)ˣ` is surjective and its kernel is the
group of automorphisms asymptotically unitarily equivalent to the identity (Phillips, Theorem
4.2.1); for unital A its image is the subgroup preserving `[1]`. Do not replace that
kernel by the approximately inner automorphisms. *Needs:* §7.4, §8.1.

**Checks.**

- `A=O₂⊗K`: `KK(A,A)=0`, so every automorphism is asymptotically unitarily equivalent to the
  identity.
- `A=O∞⊗K`: `KK(A,A)ˣ=ℤˣ={±1}`; the automorphism induced by the flip `ℤ→ℤ`, `1↦−1`, exists by
  surjectivity and is not asymptotically inner.
- Unital `A=O∞`: the image is the subgroup of `{±1}` preserving `[1]=1`, namely `{1}`, so every
  automorphism of `O∞` acts trivially on `KK(O∞,O∞)`.

### 8.3 Bootstrap algebras with prescribed K-groups

Build the range theorem without a classification of AT algebras. Construct separable nuclear
bootstrap algebras with arbitrary prescribed countable graded K-groups (Rørdam, §8.4): use OperatorKTheory K8's countable free resolutions `0→P₁→P₀→G→0`; realize the integer
matrix `P₁→P₀` on `K₁` by *-homomorphisms between stabilized `c₀` sums of `C₀(ℝ)`, using circle
maps of signed degree and orthogonal matrix blocks, where column finiteness and `c₀`
convergence give a bounded *-homomorphism even for infinite-rank resolutions. The mapping cone
then has `K₀=G` and `K₁=0` by the six-term sequence. Combine this construction with its
suspension to obtain `K₀=G₀`, `K₁=G₁` with the chosen identifications. *Needs:* OperatorKTheory
K2–K3, K8; CStarAlgebras C5.

**Checks.**

- `G=ℤ/n`: resolution `0→ℤ→ℤ→ℤ/n→0` with the map n, realized by a degree-n circle map
  `C₀(ℝ)⊗K→C₀(ℝ)⊗K`; the mapping cone has `K₀=ℤ/n`, `K₁=0`, the K-groups of `O_(n+1)`.
- `G=ℤ`: resolution `0→0→ℤ→ℤ→0`; the mapping cone of `0→C₀(ℝ)⊗K` is `C₀(ℝ)⊗K` suspended once,
  with `K₀=ℤ`, `K₁=0`, the K-groups of `O∞`.
- `G=ℚ`: an infinite-rank resolution `0→ℤ^(ℕ)→ℤ^(ℕ)→ℚ→0` with a column-finite matrix, realized
  on `c₀` sums; the resulting algebra has `K₀=ℚ`, `K₁=0`.

### 8.4 Bootstrap membership and the UCT condition

For separable nuclear A prove equivalence of bootstrap membership with OperatorKTheory K8's UCT
condition: for every separable D and both degrees the K-theory action γ is surjective and its
canonical kernel-to-Ext map κ is an isomorphism (Rørdam, §8.4). Choose a bootstrap
realization B of `K_*(A)` by §8.3, use the UCT for B to lift the chosen K-isomorphism to
`y∈KK(B,A)`, and show by the naturality of γ and κ under Kasparov products that precomposition
by y gives isomorphisms on the outside terms of the UCT sequences, hence on `KK_i(−,D)`;
construct left and right inverses of y by taking `D=B` and `D=A`. Thus A is KK-equivalent to B
and lies in the bootstrap class; the converse is K8's UCT. *Needs:* §8.3; OperatorKTheory K6, K8.

**Checks.**

- `A=ℂ`: the bootstrap realization of `(ℤ,0)` is ℂ itself and `y=1`.
- `A=O_n`: realization by §8.3's cone with `K_*=(ℤ/(n−1),0)`; the UCT then gives
  `KK(O_n,O_n)=Hom(ℤ/(n−1),ℤ/(n−1))⊕Ext(ℤ/(n−1),ℤ/(n−1))`, of order `(n−1)²`.
- A separable nuclear A with `KK(A,D)=0` for all D is KK-contractible and in the bootstrap
  class; `O₂` is the example.

### 8.5 Kirchberg algebras KK-equivalent to a given nuclear algebra

Construct a Kirchberg algebra KK-equivalent to any separable nuclear A (Rørdam, §8.4). For nonzero A let `I=A⊗K`, choose a unital copy of `O₂` in
`M(I)`, and form `E=I+O₂`; verify that the quotient copy is injective and obtain a separable
unital nuclear split extension `0→I→E→O₂→0`. Since `O₂` is KK-contractible, `I→E` is a
KK-equivalence and `[1_E]=0`. For `A=0` use `E=O₂`. Set `B=E⊗O∞`. Obtain a unital full
endomorphism θ of B factoring through `O₂` using §5.6, with KK-class 0. With a unital Cuntz
pair in B form the injective unital endomorphism `φ(b)=s₁bs₁*+s₂θ(b)s₂*`. Prove `KK(φ)=1` and
that every nonzero positive element has full image. The sequential limit is simple, separable
and nuclear; prove that `O∞` absorption passes to the limit by §6.4's finite-set criterion, so
the limit is a Kirchberg algebra. *Needs:* §5.6, §6.4, §7.1; CStarAlgebras C1, C5–C6;
OperatorKTheory K5–K7.

**Checks.**

- `A=ℂ`: `I=K`, `E=K+O₂⊂B(ℓ²)=M(K)`, and `[1_E]=0` since `1_E` is the unit of the copy of
  `O₂`; the limit is a unital Kirchberg algebra with invariant `(ℤ,0,0)`, which by §8.1 and
  §8.7 is `pO∞p` for a nonzero projection p of class 0.
- `A=0`: `E=O₂`, `B=O₂⊗O∞≅O₂`, and the limit is `O₂`.
- The Cuntz-pair endomorphism has `KK(φ)=KK(Ad s₁)+KK(Ad s₂∘θ)=1+0`, using §7.1's Cuntz sum
  and the vanishing of `KK(θ)`.

### 8.6 The KK telescope and the Milnor sequence

Supply the KK argument for the limit: build the mapping telescope and its semisplit exact
sequence for injective sequential systems of separable nuclear algebras, and use
OperatorKTheory K5's countable additivity to obtain the product groups in the telescope
argument. For a limit `L=lim Bₙ` and separable D derive the contravariant Milnor sequence
`0→lim¹ KK₁(Bₙ,D)→KK₀(L,D)→lim KK₀(Bₙ,D)→0` and its degree-shifted counterpart (Blackadar,
Theorem 21.5.2; Rørdam, §8.4). Consume AlgebraicTopology Stage 6.0's generic lim¹ of a countable
inverse system (the cokernel of `1−shift` on the product) with its functoriality and
constant-tower vanishing; the KK telescope and its Milnor sequence are the targets here. For the
KK-identity system of §8.5 the bonding maps are the identity in both degrees; prove that the
odd-degree lim¹ vanishes and that the limit map induces isomorphisms on `KK(−,D)` for each
separable D, and conclude by the Yoneda argument in the KK-category that it is a
KK-equivalence. Do not substitute ordinary continuity of KK. *Needs:* §8.5; AlgebraicTopology
Stage 6.0; OperatorKTheory K5–K6; CStarAlgebras C5.

**Checks.**

- For a constant tower `G→G→G→…` with identity maps, `lim=G` and `lim¹=0`; this is the case of
  §8.5.
- For the system `O∞→M₂(O∞)→M₄(O∞)→…`, `x↦diag(x,x)`, with limit `O∞⊗CAR`: `KK₁(Bₙ,ℂ)=0`
  and `KK₀(Bₙ,ℂ)=Hom(ℤ,ℤ)=ℤ` with transition maps multiplication by 2, so `lim=0` and
  `lim¹=ℤ̂₂/ℤ` (2-adic integers modulo ℤ); the degree-shifted Milnor sequence gives
  `KK₁(O∞⊗CAR,ℂ)=lim¹=ℤ̂₂/ℤ`, matching `Ext(ℤ[1/2],ℤ)` from the UCT, while
  `KK₀(O∞⊗CAR,ℂ)=0=Hom(ℤ[1/2],ℤ)`.
- Ordinary continuity fails: in that example `KK₁(lim Bₙ,ℂ)→lim KK₁(Bₙ,ℂ)=0` is not
  injective.

### 8.7 The range theorem

Apply §8.5–§8.6 to the bootstrap realizations of §8.3, and prove that bootstrap membership is
preserved by the construction. Stabilizing gives every pair of countable abelian groups as the
K-groups of a stable UCT Kirchberg algebra (Rørdam, §8.4). For `g∈G₀`
choose a nonzero projection with that class in the stable realization (§4.5) and pass to its
full corner: this realizes exactly `(G₀,g,G₁)` by a unital UCT Kirchberg algebra, including
`g=0`. Transport the K-groups and the unit class through the corner equivalence, and combine
with §8.1 for uniqueness. *Needs:* §4.5, §8.1, §8.3, §8.5, §8.6; HilbertModules H4.

**Checks.**

- `(0,0,0)` is realized by `O₂`; `(ℤ,1,0)` by `O∞`; `(ℤ,0,0)` by `pO∞p` for a nonzero
  projection of class 0, which is not isomorphic to `O∞` (§8.1).
- `(ℤ/(n−1),1,0)` is realized by `O_n` and `(ℤ[1/2],1,0)` by `O∞⊗CAR`; `(ℤ,1,ℤ)` is
  realized by a unital UCT Kirchberg algebra which is not `O∞⊗C(S¹)`, since that algebra has
  the same invariant but is not simple.
- `(ℚ,1,ℚ/ℤ)` is realized, since both groups are countable; no countability restriction beyond
  that applies.

### 8.8 Cuntz-algebra examples

Compute the classifications of the finite Cuntz algebras, `O∞`, their matrix algebras,
stabilizations and tensor products using OperatorKTheory K7's unit classes and Künneth
sequence. `O₂` is the unique unital UCT Kirchberg algebra with zero K-groups; `O∞` has
invariant `(ℤ,1,0)`. For finite `n≥2` and positive k, l, prove `M_k(O_n)≅M_l(O_n)` iff
`gcd(k,n−1)=gcd(l,n−1)` (Rørdam, §8.4), since the unit class of `M_k(O_n)` is
`k∈ℤ/(n−1)` and the automorphisms of `ℤ/(n−1)` are multiplications by units. Explain how the
unit class distinguishes unital algebras whose stabilizations agree, and relate full corners and
strong Morita equivalence to the stable classification. These examples use the UCT only for
their verified bootstrap models. *Needs:* §8.1, §8.7; OperatorKTheory K7–K8.

**Checks.**

- `n=2`: `gcd(k,1)=1` for all k, so `M_k(O₂)≅O₂` for every k.
- `n=3`: `M_k(O₃)≅O₃` iff k is odd, and `M₂(O₃)≅M₄(O₃)≇O₃`.
- `n=4`: `gcd(k,3)∈{1,3}`, so `M₂(O₄)≅O₄` while `M₃(O₄)≇O₄` though `M₃(O₄)⊗K≅O₄⊗K`.
- `O₂⊗O₃≅O₂` (§6.1) and `O₃⊗O₄` has `K₀=ℤ/2⊗ℤ/3⊕Tor(ℤ/2,ℤ/3)=0` and `K₁=0`, so
  `O₃⊗O₄≅O₂` by §8.1.

### Examples

`O_n`, `M_k(O_n)`, `O∞`, `pO∞p` with `[p]=0`, `O∞⊗CAR`, `O₃⊗O₄≅O₂`, and the mapping cones of
§8.3.

### Dependencies

Layers 4–7; CStarAlgebras C1, C5–C6; HilbertModules H4; OperatorKTheory K2–K3, K5–K8;
AlgebraicTopology Stage 6.0; Phillips (§4), Rørdam (§§8.2–8.4), Blackadar (§§21.3,
21.5).

## Downstream consumers

TemperleyLiebOperatorAlgebras consumes Layer 2's AF presentations and the K₀ computation of
inductive limits of finite-dimensional algebras. No roadmap consumes Layers 4–8 at present;
OperatorKTheory K8 and CStarAlgebras C9 defer *-isomorphism classification and the dimension-group
classification of AF algebras to this roadmap.

## References

- Rørdam, Part I of Rørdam–Størmer, *Classification of Nuclear C*-Algebras. Entropy in Operator
  Algebras*, Encyclopaedia of Mathematical Sciences 126, Springer, 2002: §§1.1–1.5 for AF
  algebras, dimension groups and scales (Definition 1.1.15, Theorem 1.3.3, Proposition 1.3.4,
  Theorem 1.4.4, Proposition 1.4.5); §2.3 for approximate intertwining; §§4.1–4.2 for pure
  infiniteness, corners and Cuntz models; Chapters 5–6 for `O₂` uniqueness and embedding;
  Chapter 7 for tensor absorption; §§8.2–8.4 for KK representation, classification and the
  Kirchberg-model construction. Cited by locator; the text is not open access.
- Blackadar, *K-Theory for Operator Algebras*, 2nd edition, MSRI Publications 5, Cambridge,
  1998: Chapter 7 (Theorems 7.3.2 and 7.4.1) for AF classification and dimension groups;
  §§21.3 and 21.5 (Theorem 21.5.2) for the mapping telescope and the contravariant KK Milnor
  sequence. Cited by locator.
- [Glimm, *On a certain class of operator algebras*, Trans. Amer. Math. Soc. 95 (1960),
  318–340](https://www.ams.org/journals/tran/1960-095-02/S0002-9947-1960-0112057-5/):
  §1 (Definitions 1.3–1.5, Lemma 1.11, Theorems 1.12–1.13) for UHF algebras and their
  classification.
- [Bratteli, *Inductive limits of finite dimensional C*-algebras*, Trans. Amer. Math. Soc.
  171 (1972), 195–234](https://www.ams.org/journals/tran/1972-171-00/S0002-9947-1972-0312282-2/):
  1.8 for diagrams, Theorem 2.2 for the local characterization, Theorem 3.3 for ideals.
- [Goodearl–Wehrung, *Representations of distributive semilattices in ideal lattices of
  various algebraic structures*](https://arxiv.org/abs/math/0011083), §3: Theorem 3.3 (the
  Effros–Handelman–Shen theorem, citing Effros–Handelman–Shen, Theorem 2.2) and the Triangle
  Lemma.
- [Kirchberg–Phillips, *Embedding of exact C*-algebras in the Cuntz algebra O₂*,
  J. reine angew. Math. 525 (2000)](https://arxiv.org/abs/funct-an/9712002): Proposition 0.4,
  Definition 0.5, Lemma 0.6, Proposition 0.7, Lemma 1.10, Lemma 1.12, Lemma 1.14, Theorem 1.15,
  Lemma 2.2, Corollary 2.3, Lemmas 2.4–2.7 and Theorem 2.8 (locators of the arXiv version).
- [Phillips, *A classification theorem for nuclear purely infinite simple C*-algebras*,
  Doc. Math. 5 (2000), 49–114](https://ems.press/journals/dm/articles/8965006): Definitions
  1.2.1 and 1.2.5, Theorem 2.3.7, Corollary 2.3.10, Theorems 4.1.1 and 4.1.3, Theorem 4.2.1,
  Corollary 4.2.2, Theorem 4.2.4.
- Design notes: the [Cuntz-comparison discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Notation.20for.20AntisymmRel/with/488146684)
  on keeping positivity and Cuntz comparison as separate relations, and the
  [UHF and direct-limit discussion](https://leanprover.zulipchat.com/#narrow/stream/113489-new%20members/topic/Early%20feedback%20on%20approach%20towards%20formalizing%20UHF%20algebras%3F)
  on star-algebra structure over Mathlib's algebraic `DirectLimit` and matrix amplification,
  which CStarAlgebras C5's inductive limits follow (accounting for the limiting seminorm and
  completion when connecting maps are not injective, with `CStarMatrix` for the C*-norms).

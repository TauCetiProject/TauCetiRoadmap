# Roadmap: contact homology and the symplectic field theory formalism

**Summary.** Construct rational contact homology of closed cooriented contact manifolds, its
exact symplectic cobordism maps and its symmetric monoidal functor on homology, from the
punctured-curve analysis, the coherent virtual count comparisons and the orientation-line
algebra that make the construction work for multiply covered curves (Pardon §1.6, Theorem 1.1,
p. 7). Build the multiple-input and arbitrary-genus SFT algebra on explicit coefficient
carriers (EGH §§2.2–2.5), together with its geometric realization data and the conditional
comparison theorems that follow from them. These are separate levels of the theory: the contact
differential counts one-positive-end genus-zero curves, while the SFT formalism also describes
the fusion of several inputs and higher genus. The basic contact construction is over ℚ and is
an unconditional construction target (Layers 0–6). The general SFT realization assertion of
Layer 8 is a precisely stated research-level assertion whose deliverables are its data, its
statement and its conditional algebraic consequences; its truth is not a premise hidden in the
contact-homology theorem. Layer 9 constructs the nonexact receiving objects and maps.

## Scope and ownership

This roadmap owns:

- the parametrized and unparametrized closed Reeb orbits of a nondegenerate contact form, their
  covering multiplicities, asymptotic markers, orientation lines and the good/bad dichotomy
  (Layer 0);
- the free unital supercommutative algebra on an integer- or parity-graded ℚ-module, its
  grading, its odd derivations and its tensor-product and quotient comparisons (Layer 0);
- stable punctured pseudoholomorphic maps with Reeb asymptotics into completed cobordisms and
  symplectizations, their energy, their holomorphic buildings and compactifications, and the
  smaller tree-model compactification without trivial cylinders (Layer 1);
- the weighted Reeb-end Fredholm set-up, the punctured index formula in SFT normalization and
  the determinant-line gluing for Reeb ends (Layer 2);
- augmented local gluing, orientation descent and the labelled/unlabelled count formulas
  (Layer 3);
- the contact implicit atlases on the tree-indexed moduli problems, the proof that they satisfy
  the axioms of the generic virtual-class engine, the cell-like stratification by a finite
  category of tree types with its stratified virtual complex, and the application of the
  engine's package to these atlases (Layer 4);
- the coherent chain-level count diagrams, the contact differential, the exact cobordism maps
  and the contact homology functor (Layer 5);
- augmentations, linearized contact homology, hypertight and ellipsoid examples (Layer 6);
- the normal-ordered Poisson and Weyl carriers, the Hamiltonian differentials, the cobordism
  potential bimodules, the weighted exact-sector carrier, the vacuum sector and the Fock
  representation with its curved derived brackets (Layer 7);
- the graph-indexed realization data, the realization assertion and its conditional sewing
  consequences, exact and nonexact (Layer 8);
- class-labelled coefficients, admissibility, the quantum and rational receiving maps for
  nonexact cobordisms, and the decorated nonexact category (Layer 9).

It leaves to named owners, and imports from them by section:

- ContactGeometry CG1–CG6: contact forms, Reeb vector fields, symplectizations, contact-type
  ends and the elementary contact transformations. This roadmap constructs only the orbit and
  punctured-count applications of that geometry.
- HeegaardFloer §2.2 (F0.0) and §§3.1–3.5 (F1.1–F1.5): Banach/Fredholm theory, cylindrical
  Sobolev spaces, elliptic/adjoint/unique-continuation theory, spectral flow, the single
  Maslov/Conley–Zehnder and determinant-line theory, punctured weighted Riemann–Roch and the
  finite-dimensional zero-mode extensions. HeegaardFloer §§4.3–4.5 (F2.3–F2.5) supply ordinary
  curve regularity, compactness inputs and conditional gluing only at their stated hypotheses.
  Layers 1–3 construct the nonlinear Reeb-end and building adapters.
- ImplicitAtlases Layers 0–6 (V0–V6): the generic virtual-class engine on an arbitrary compact
  Hausdorff space with an implicit atlas, namely K-sheaves, Čech cohomology and finite-group
  invariants (V0), implicit atlases with and without boundary (V1), deformation spaces and the
  virtual cochain complex (V2), the virtual orientation sheaf and the Čech comparison (V3), the
  obstruction complex, the global trace and the virtual class with finite-subatlas
  independence (V4), the boundary, cobordism, refinement, pushforward and regular-manifold
  normalization laws (V5), and cell-like stratified atlases over a finite poset with the
  stratified virtual complex, product atlases and the product class (V6). None of it is
  restated here. Layer 4 constructs the contact atlases on the tree-indexed moduli problems
  and proves that they satisfy the axioms of ImplicitAtlases (4.1), owns the one extension the
  engine does not state, the cell-like stratification by a finite category of tree types
  rather than a poset, with its stratified virtual complex (4.2), and applies the engine's
  package to these atlases (4.2–4.3). Layer 5 constructs the contact-specific coherent chain
  diagrams needed before extracting counts.
- DGAInfinity Layers 0–1: generic graded modules, signed tensor operations and the DG/A∞
  algebra vocabulary. StablePeriodicCurved Layer 3: parity complexes and their integer/parity
  comparisons. The contact differential has square zero; ℏ is a genus parameter, not a
  curved-module curvature element.
- MorseTheory M1–M6: finite-dimensional Morse operations used in the explicit comparison
  examples. This roadmap introduces no Morse complex and no linear index construction of its
  own.
- MorseNovikov N1: the period-controlled completed group ring. Layer 9 constructs the
  signed-word convolution adapter on it.
- GromovWittenTheory, later in the build, owns the closed stable-map compactification and the
  Gromov–Witten invariants of closed symplectic manifolds. The identification of the
  vacuum/closed-map sector of Layer 7.7 with those invariants is a theorem about its objects and
  is left to it; this roadmap constructs the sector, its filtration and its exponential from its
  own realization data (Layers 7.7, 8.4 and 9) and takes nothing from the closed theory. Its
  closed stable-map compactification does not establish the Reeb-end compactification.

Already in the library and consumed, not restated: the internal grading `TauCeti.InternalGrading`,
the DG-algebra predicate `TauCeti.IsDGAlgebra`, the Koszul-signed graded tensor product and its
total-degree grading, lifts and DG structure, the homogeneous-quotient grading, and Mathlib's
tensor algebra, unsigned symmetric algebra, graded tensor product and `Int.negOnePow` (listed in
the supplier contracts). HamiltonianFloerOperations consumes this roadmap's contact/Reeb
buildings for its Hamiltonian application and supplies nothing to it.

## Conventions

Work with a closed smooth cooriented contact manifold Y of dimension 2n−1, n≥2, and a contact
form λ with ker λ=ξ. Every covered closed Reeb orbit is nondegenerate. An exact cobordism has a
compact core, specified positive and negative contact boundaries, a global primitive, and its
cylindrical completion (BEHWZ §3.2, p. 9). Its ends carry fixed cylindrical almost complex
structures, with Ĵ∂s=R_λ and Ĵ|ξ compatible with dλ (BEHWZ §2.1, p. 4). Ĵ is ω̂-tame over the
entire completed cobordism: ω̂(v,Ĵv)>0 for every nonzero tangent vector v, including on the
compact core (BEHWZ §2.2, p. 5 and §3.3, p. 10). For coherent parameter families Ĵ_t is tame
for ω̂_t, with the same compatible cylindrical ends and compactly supported changes on the
cores. Tameness is preserved under the restriction, common-refinement, neck and gluing
constructions of Layers 1–5, and on compact parameter/core sets it gives the quantitative lower
bounds used in the energy and gluing estimates; uniform end bounds use the fixed cylindrical
data, not an asserted global uniform bound on an arbitrary noncompact family. Global
compatibility is a stronger admissible choice. Disjoint unions and empty ends are included.
Nonexact coefficient-valued constructions carry the additional support and class data of
Layer 9; exact-cobordism theorems retain their exactness hypothesis.

| Datum | Convention |
| --- | --- |
| Morphism direction | A cobordism from Y⁺ to Y⁻ gives a map from the positive contact algebra to the negative one (EGH §2.3, p. 55; Pardon §1.3, p. 5) |
| Principal coefficients | ℚ; orbit orientation lines are formed integrally before scalar extension |
| Principal grading | Parity, without an assumed global integer Conley–Zehnder lift (Pardon Definition 2.48, p. 42) |
| Integer comparison | For a specified compatible lift, the homological degree of q_γ is CZ_SFT(γ)+n−3 and the differential has degree −1 (Pardon §1.8, p. 11; EGH §2.2, p. 47) |
| Native DG comparison | Reindex C^k=CC_(−k), so the differential has degree +1 |
| Signs | Koszul signs use the actual parity; orientation and normal factors retain their displayed order |
| Multiplicities | κ_γ is the positive covering multiplicity; marker and permutation factors are derived from the labelled/unlabelled comparison |
| Symplectization energy | Hofer's bounded energy (BEHWZ §5.3, p. 22), not the generally infinite integral of d(e^s λ) |
| Full SFT normalization | Normal-ordered q then p; `[p_γ,q_η]_super=δ_γη κ_γ ℏ`, with ℏ even (EGH (19), p. 49) |

The sign witnesses: for a simple orbit γ with κ_γ=1 the Weyl relation reads `[p_γ,q_γ]=ℏ`
and the left representation `p_γ=ℏ∂/∂q_γ` gives `p_γ(q_γ)=ℏ`; the direction witness is the
identity cylinder, whose kernel sends the positive generator q_γ⁺ to the negative generator
q_γ⁻ (Layer 9.3).

## Exact supplier contracts

### From Mathlib

- `TensorAlgebra` and `TensorAlgebra.ι` (`Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean`), with
  the ℕ-grading `TensorAlgebra.gradedAlgebra` (`Mathlib/LinearAlgebra/TensorAlgebra/Grading.lean`);
  the integer input-degree grading of Layer 0.4 is constructed here.
- `RingQuot` and `RingQuot.mkAlgHom` (`Mathlib/Algebra/RingQuot.lean`): the quotient of an
  algebra by a relation, with its universal property.
- `SymmetricAlgebra` (`Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean`): the unsigned
  symmetric algebra, used only on the even part of V.
- `GradedTensorProduct` (`Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean`): the
  Koszul-signed tensor product of two internally graded algebras, for any index type with a
  `Module ι (Additive ℤˣ)` structure.
- `Int.negOnePow` (`Mathlib/Algebra/Ring/NegOnePow.lean`): the sign (−1)^n as a unit of ℤ, used
  for every Koszul sign in integer degree.
- Manifolds, vector bundles, flows, `ModuleCat`, quotients, direct sums, cochain complexes and
  homology, in their native forms.

### From Tau Ceti

- `TauCeti.InternalGrading` (`TauCeti/Algebra/Module/GradedModule/Internal.lean`): an internal
  ℤ-grading of a module, with the field `isInternal : DirectSum.IsInternal piece`. Layer 0's
  integer-graded lane takes such a grading on V.
- `TauCeti.IsDGAlgebra` (`TauCeti/Algebra/Homology/AInfinity/Algebra/DG.lean`): the predicate
  that a degree-one map on an internally graded algebra is a square-zero signed derivation.
- `TauCeti.gradedTensorGrading`, `TauCeti.isInternal_gradedTensorGrading`, its graded-algebra
  instance and `TauCeti.gradedTensorLift` (`TauCeti/RingTheory/GradedAlgebra/TensorProduct.lean`):
  the total-degree grading on the Koszul-signed graded tensor product, its internality, and the
  lift of two graded algebra maps.
- `TauCeti.isDGAlgebra_gradedTensorGrading` and `TauCeti.dgTensorLift`
  (`TauCeti/Algebra/Homology/DG/Algebra/TensorProduct.lean`): the DG structure on the graded
  tensor product of two DG algebras and the lift of two DG algebra maps.
- `TauCeti.GradedAlgebra.quotientPiece` and `TauCeti.GradedAlgebra.isInternal_quotientPiece`
  (`TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean`): the grading of the quotient of
  a ring by a homogeneous two-sided ideal, and its internality.

### From TauCetiRoadmap.ContactGeometry

CG1 (contact distributions and cooriented forms), CG2 (Reeb vector fields, contact vector
fields and their flows), CG4 (symplectization with its convention `ω=dθ=−dλ`) and CG6 (the
contact/Jacobi interface). Assumed: the Reeb field R_λ is determined by λ, its rescaling law
under λ↦fλ, and the symplectization carries the tautological form.

### From TauCetiRoadmap.HeegaardFloer

§2.2 (F0.0): Fredholm determinant lines, their dual/adjoint, exact-sequence and
orientation-double-cover transport. §3.1 (F1.1): Sobolev surface and bundle adapters.
§3.2 (F1.2): interior estimates and unique continuation. §3.3 (F1.3): spectral flow on a common
domain. §3.4 (F1.4): the single Maslov/Conley–Zehnder theory with the normalization
`CZ(Ψ)=−μ_RS(graph Ψ,Δ)` and the small-rotation witness. §3.5 (F1.5): Cauchy–Riemann
Riemann–Roch on punctured surfaces with weighted ends `D=∂s−A_e` and the finite-dimensional
zero-mode extensions. §§4.3–4.5 (F2.3–F2.5): ordinary compactness, transversality and gluing,
consumed only at their stated hypotheses.

### From TauCetiRoadmap.ImplicitAtlases

§0.3 (finite-group invariants over ℚ), §0.7 (Čech cohomology with sheaf coefficients on a
compact Hausdorff space, as the colimit over finite open covers), §0.8 (pure homotopy K-sheaves
and the identification of their cohomology with the Čech cohomology of the degree-zero sheaf)
and §0.9 (extension by zero). §1.1 (implicit atlases: covering groups, obstruction
representations, thickenings, Kuranishi maps, footprints, footprint maps, regular loci and the
compatibility and transversality axioms), §1.2 (atlases with boundary and the boundary
restriction) and §1.4 (finite subatlases). §2.3 (the virtual cochain complex, absolute and
relative to the boundary, as a complex of K-presheaves), §3.1 (local orientability and the
virtual orientation sheaf), §3.4 (the Čech comparison), §4.1 (the obstruction complex), §4.2
(the global relative trace) and §4.3 (the virtual class as a functional on degree-d Čech
cohomology, finite-subatlas independence and the subatlas comparison maps). §§5.1–5.2 (the
boundary triangle, the boundary law and cobordism), §5.3 (refinements, shrinkings and disjoint
unions), §5.4 (pushforward) and §5.6 (regular-manifold normalization). §§6.1–6.2 (cell-like
stratified atlases over a finite poset, normal lines and restricted atlases), §6.3 (the
stratified virtual complex and its quasi-isomorphism), §6.4 (product atlases) and §6.5 (the
Čech external product and the product class). Assumed: every statement about the orientation
sheaf, the Čech comparison or the class is for a locally orientable atlas on a compact Hausdorff
base, and the engine takes an atlas as input and constructs no moduli space, Fredholm operator,
gluing map or compactification; Layers 1–4 construct those.

### From TauCetiRoadmap.DGAInfinity

Layer 0: internal and Mathlib-graded presentations of ℤ-graded modules, homogeneous multilinear
maps with their Koszul substitution signs, and the tensor coalgebra. Layer 1: unital and
augmented DG algebras, morphisms, tensor products and cohomology algebras.

### From TauCetiRoadmap.StablePeriodicCurved

Layer 3: differential modules and genuine two-periodic complexes as parity-graded pairs, with
the integer-to-parity comparison.

### From TauCetiRoadmap.MorseTheory

M1–M6: critical Hessians, handles, Morse exhaustions, inequalities, Morse–Bott normal bundles
and gradient convergence, used in Layer 6's comparison examples.

### From TauCetiRoadmap.MorseNovikov

N1: the period-controlled completed group ring Nov(R,H,N) with the exact support condition
"finitely many nonzero coefficients below every cutoff", its lower support bound, convolution
finiteness, completeness and the coefficient maps.

## How to read the build

Layer 0 constructs the orbits and the signed orbit algebra, the only part statable at the
pins. Layer 1 fixes the asymptotic operators and weights, defines punctured maps, energy and
buildings and proves compactness in both the retained-level and the smaller tree-model
compactification. Layer 2 builds the weighted nonlinear Fredholm set-up and proves the punctured
index formula and determinant gluing for Reeb ends. Layer 3 proves augmented local gluing and
orientation descent, including the count formulas for repeated and covered ends. Layer 4
constructs the contact implicit atlases, proves that they satisfy the axioms of ImplicitAtlases,
adds the stratification by a finite category of tree types and applies the engine's virtual
fundamental cycle package to them. Layer 5 constructs the
coherent chain-level diagrams, extracts the counts, proves d²=0 and builds the exact cobordism
maps and the symmetric monoidal functor. Layer 6 adds augmentations, linearization, hypertight
and ellipsoid examples. Layer 7 is independent algebra: the Poisson, Weyl, potential and Fock
carriers with their master equations. Layer 8 states the geometric realization data and
assertion for the full formalism, exact and nonexact, and derives the master equations from
them. Layer 9 extends coefficients by classes, proves the admissibility estimates, and
constructs the quantum and rational receiving maps of nonexact cobordisms together with their
composition laws and the decorated nonexact category.

## Layer 0: Orbit lines and the signed orbit algebra

### 0.1 Reeb orbits, iterates and genericity

Define parametrized periodic Reeb trajectories of λ, their periods and iterates, unparametrized
orbits, covering multiplicities κ_γ, asymptotic markers and their finite reparametrization groups
ℤ/κ_γ (BEHWZ §2.3, p. 6; EGH §1.2). Prove a positive lower bound for periods and the finiteness
of nondegenerate unparametrized orbits below each fixed action bound, by the compactness and
isolation argument including covered orbits. Construct generic nondegenerate contact forms using
the parametrized Reeb return map and its iterates; a generic-J theorem is not this assertion.

- An unparametrized orbit with multiplicity κ has exactly κ asymptotic markers, permuted
  cyclically by the reparametrization group.
- The iterate γ^k of a simple orbit of period T has period kT and multiplicity k.
- Nondegeneracy of γ^k means 1 is not an eigenvalue of the k-th power of the linearized return
  map restricted to ξ.

**Checks.**

- On the standard contact three-sphere with an irrational ellipsoid form the simple orbits are
  the two Hopf circles, and the action bound T admits finitely many iterates of each; a
  definition that forgot the lower period bound would admit infinitely many orbits below T.
- The degenerate round form on S³ has a circle's worth of simple orbits, so it fails the
  standing hypothesis; a definition of "nondegenerate" that tested only the simple orbit, not its
  iterates, would wrongly accept forms whose double cover is degenerate.
- A parametrized trajectory and its time-shift by half a period are the same unparametrized
  orbit with different markers.

*Needs:* ContactGeometry CG2 (Reeb field and flow), ContactGeometry CG4 (symplectization).

### 0.2 Orientation lines and good and bad orbits

For an orbit γ define the integral rank-one orientation line o_γ as the determinant line of
the asymptotic operator datum of Pardon Definition 2.46 (p. 41), using the supplier determinant
lines, and its cyclic marker action. Call γ good when this action is trivial and bad otherwise
(Pardon Definition 2.49, p. 43). Prove that this agrees with the even-cover parity criterion:
the bad orbits are exactly the even covers γ^(2k) of simple orbits whose linearized return map
has an odd number of eigenvalues in (−1,0), counted with multiplicity (Pardon (2.59) and
Definition 2.49, p. 43; EGH Lemma 1.8.8, p. 27 and Remark 1.9.2, p. 34), including invariance
under changing auxiliary trivializations. Define V as the direct sum over good orbits of
ℚ⊗_ℤ o_γ, with the parity of each summand the parity of γ (Pardon Definition 2.48, p. 42). The
orientation line is retained until a temporary basis is chosen for a coordinate formula.

- The parity of γ is the reduction mod 2 of CZ(γ)+n−3 whenever an integer lift is chosen, and
  equals the sign of det(I−A_γ) in general (Pardon Definition 2.48, p. 42).
- o_γ is independent of the auxiliary datum up to canonical isomorphism for good γ.
- The marker action on o_γ is a homomorphism ℤ/κ_γ→{±1}.

**Checks.**

- A simple orbit is always good: the group ℤ/1 acts trivially.
- An odd cover of any orbit is good, since a homomorphism from an odd cyclic group to {±1} is
  trivial; a criterion that declared all covers bad would fail here.
- In dimension three, the double cover of a negative hyperbolic orbit, with exactly one
  eigenvalue in (−1,0) and its partner below −1, is bad by (2.59); the double covers of an
  elliptic orbit, with no real eigenvalue, and of a positive hyperbolic orbit, with eigenvalues
  λ and 1/λ in (0,∞), are good. A criterion counting eigenvalues in (0,1) instead of (−1,0)
  would declare the first good and the third bad. In dimension five, an orbit with two
  eigenvalues in (−1,0) has an even count, so its double cover is good.

*Needs:* Layer 0.1; HeegaardFloer §2.2 (F0.0) determinant lines; HeegaardFloer §3.4 (F1.4)
Conley–Zehnder normalization.

### 0.3 The free supercommutative algebra

Construct the free unital supercommutative algebra A(V) on a graded ℚ-module V as the quotient
of the native tensor algebra by the relation xy=(−1)^(|x||y|)yx for homogeneous x, y (Pardon
(1.1), p. 3). In the integer-graded lane, for an internal grading G of V, A(V) is `SignedSym G`,
the `RingQuot` of `TensorAlgebra ℚ V` by the Koszul relation `signedSwapRel G`, with generator
map `generator G`. Its degree-p piece `signedSymPiece G p` is the span of the images of words in
homogeneous generators of total degree p. Prove that these pieces make A(V) an internally
ℤ-graded algebra (`nonempty_gradedAlgebra_signedSymPiece`): the relation is homogeneous, so the
input-degree grading of the tensor algebra descends. Prove the universal property into
supercommutative algebras, functoriality in graded maps, the homogeneous decomposition, basis
independence, and the comparison with Sym(V_even)⊗Λ(V_odd) over ℚ; in particular odd squares
vanish. Mathlib's unsigned `SymmetricAlgebra` is used only on the even part. Supply the
inclusions, the projection onto each word length, finite signed monomial expansions,
permutation and braid identities, coefficient extension and the disjoint-orbit tensor-product
comparison of 0.4. These are the specialized free orbit-algebra adapters; the generic DG
interface remains with DGAInfinity.

- The empty word gives 1 in degree 0, and the product of pieces of degrees p and q lies in the
  piece of degree p+q.
- For x of degree p and y of degree q, `generator G x * generator G y` equals
  (−1)^(pq) `generator G y * generator G x`.
- A graded linear map V→B into a supercommutative graded algebra extends uniquely to a graded
  algebra map A(V)→B.

**Checks.**

- V=0: A(V)=ℚ in degree 0 and zero in every other degree.
- V=ℚx with |x|=1: x²=−x², so 2x²=0 and x²=0 over ℚ; the degree-2 piece is zero. Mathlib's
  unsigned `SymmetricAlgebra` has x²≠0 here, so it is the wrong carrier for the odd part.
- V=ℚx with |x|=0: the degree-2 piece is ℚx²≠0, as in the symmetric algebra.
- V=ℚx⊕ℚy with |x|=|y|=1: xy=−yx and the degree-2 piece is ℚxy, one-dimensional; a
  definition imposing xy=yx would make it zero.
- A negative degree: |x|=−1, |y|=3 gives xy=(−1)^(−3)yx=−yx, the sign computed by
  `Int.negOnePow`.

*Needs:* Mathlib `TensorAlgebra`, `RingQuot`, `Int.negOnePow`; Tau Ceti `InternalGrading`.

### 0.4 Tensor, quotient and parity comparisons

For the disjoint-orbit comparison use Mathlib's signed `GradedTensorProduct` carrier with the
Tau Ceti total-degree grading `TauCeti.gradedTensorGrading` (its internality
`TauCeti.isInternal_gradedTensorGrading`, graded-algebra instance, `TauCeti.gradedTensorLift`
and the two graded inclusions), and assemble differentials with
`TauCeti.isDGAlgebra_gradedTensorGrading`, `TauCeti.dgTensorLift` and the DG inclusions. Prove
that A(V⊕W) is the graded tensor product A(V)⊗A(W) with its Koszul multiplication, compatibly
with generators, multiplication, differentials and coefficient maps (Pardon (1.22) and the
super tensor product, pp. 8–9). Construct the tensor input-degree grading on the native tensor
algebra and descend it to the signed quotient by the images of homogeneous tensor pieces, using
`TauCeti.GradedAlgebra.quotientPiece` and `TauCeti.GradedAlgebra.isInternal_quotientPiece` for
the homogeneous two-sided ideal, passing from `RingQuot` to the two-sided ideal quotient where
that API needs it.

Define the parity grading of an internal ℤ-grading G of V as the internal ℤ/2-grading whose even
piece is the sum of the pieces G.piece 2k and whose odd piece is the sum of the pieces
G.piece 2k+1. Prove that it is internal, that the signed swap relation of G is the signed swap
relation of its parity grading, and hence that the parity-graded A(V) built directly from
parities is the parity reduction of the integer-graded `SignedSym G`. This comparison does not
produce an integer lift from parity data.

- The two inclusions A(V)→A(V⊕W) and A(W)→A(V⊕W) are graded algebra maps, and their images
  supercommute.
- The parity reduction of the degree-p piece lies in the piece of parity p mod 2.
- A signed Leibniz map of degree one for G is a signed Leibniz map of odd parity for the parity
  grading.

**Checks.**

- V=ℚx, W=ℚy, both odd: in A(V)⊗A(W) the element (x⊗1)(1⊗y) equals x⊗y and
  (1⊗y)(x⊗1)=−x⊗y by the Koszul rule; an unsigned tensor product would give +x⊗y.
- Parity pushforward of the grading on ℚx⊕ℚy with |x|=0, |y|=3: even piece ℚx, odd piece ℚy;
  a pushforward that sent degree 3 to the even piece would make xy=yx.
- The quotient grading: the image of the degree-2 tensor piece of T(ℚx) with |x|=1 in the
  signed quotient is zero, consistent with 0.3.

*Needs:* Layer 0.3; Mathlib `GradedTensorProduct`; Tau Ceti `gradedTensorGrading`,
`isInternal_gradedTensorGrading`, `gradedTensorLift`, `isDGAlgebra_gradedTensorGrading`,
`dgTensorLift`, `GradedAlgebra.quotientPiece`, `GradedAlgebra.isInternal_quotientPiece`;
DGAInfinity Layer 0; StablePeriodicCurved Layer 3.

### 0.5 Odd derivations of the orbit algebra

Prove that a degree-one linear assignment δ:V→A(V), sending the piece of degree p into the piece
of degree p+1, extends uniquely to a linear map d of A(V) satisfying the signed Leibniz rule
d(ab)=d(a)b+(−1)^p a d(b) for a of degree p (`exists_unique_odd_extension`), and that a
degree-one signed Leibniz map d squares to zero if and only if d∘d vanishes on generators
(`odd_square_zero_iff_generators`): the square of an odd derivation is an even derivation, hence
determined by its values on generators. After the generator identity, the result is a
`TauCeti.IsDGAlgebra` for the graded algebra structure of 0.3. Prove the parity-only versions
when only a parity grading is supplied. The second theorem reduces the geometric boundary
identity of Layer 5 to a checkable algebraic statement; it does not supply that identity.

**Checks.**

- |x|=0, |y|=1, |z|=2 with x↦y, y↦z, z↦0: d²x=dy=z≠0, so d²≠0; the assignment x↦y, y↦0,
  z↦0 gives d²=0 on generators, hence d²=0.
- The degree hypothesis is needed for uniqueness and existence: for V=ℚ³ all odd with δx=z,
  δy=δz=0 (δ of degree 0, not 1), d(xy)=zy while d(−yx)=yz=−zy, so no Leibniz extension exists.
- The degree hypothesis is needed for the "iff": for |x|=|y|=0 and the ordinary derivation
  d=y∂_x, d(dx)=dy=0 and d(dy)=0 on generators, yet d²(x²)=d(2xy)=2y²≠0.
- d(1)=0 follows from the Leibniz rule applied to 1·1.

*Needs:* Layer 0.3; Tau Ceti `IsDGAlgebra`.

### Examples

- The orbit algebra of an irrational ellipsoid boundary (Layer 6.4): all generators even, so
  A(V) is a polynomial algebra and d=0.
- V=ℚx⊕ℚy with x even, y odd: A(V)=ℚ[x]⊗Λ(y), with degree-2 piece ℚx² and degree-1 piece ℚy
  when |x|=2, |y|=1.
- The signed swap relation witness x⊗y ~ (−1)^(pq) y⊗x at (p,q)=(1,1), (0,5), (−1,3): signs
  −1, +1, −1.

### Dependencies

ContactGeometry CG2 and CG4; HeegaardFloer §2.2 (F0.0) and §3.4 (F1.4); DGAInfinity Layer 0;
StablePeriodicCurved Layer 3; Mathlib `TensorAlgebra`, `RingQuot`, `SymmetricAlgebra`,
`GradedTensorProduct`, `Int.negOnePow`; Tau Ceti `InternalGrading`, `IsDGAlgebra`, the graded
tensor and homogeneous-quotient API.

## Layer 1: Punctured maps, energy and compactification

### 1.1 Asymptotic operators and weights

Identify the normal asymptotic operator A_γ=−J∂t−S_γ(t) along a Reeb orbit with the selfadjoint
graph-domain carrier of HeegaardFloer §3.5 (F1.5), in a unitary trivialization of ξ along γ
(Pardon Definition 2.28, p. 34). Prove its spectral gap, coefficient regularity and the
frame-change laws. Split off the ℝ and Reeb tangential directions and construct the
finite-dimensional phase/translation extensions. For every fixed finite list of ends choose
weights δ smaller than their nonzero spectral gaps, and define the weighted Sobolev spaces of
Pardon Definition 2.34 (p. 35) and Definition 2.36 (p. 36) on the supplier carrier.

- Nondegeneracy of γ is equivalent to 0 not being an eigenvalue of A_γ.
- Changing the trivialization by a loop of winding w shifts the Conley–Zehnder index by 2w and
  conjugates A_γ.
- The spectrum of A_γ is discrete, real and unbounded in both directions.

**Checks.**

- For the trivial loop S_γ=0 on ℂ, A=−i∂t has spectrum 2πℤ, gap 2π, and 0 is an eigenvalue:
  this is the degenerate case, excluded.
- For S_γ=ε (a small positive rotation), the eigenvalue 0 moves to −ε and the Conley–Zehnder
  index is −1 in the F1.4 normalization; a convention with the opposite sign would give +1.
- Two ends with gaps 2π and 1 admit a common weight δ=1/2; δ=2 fails for the second.

*Needs:* Layer 0.1; HeegaardFloer §3.3 (F1.3), §3.4 (F1.4), §3.5 (F1.5).

### 1.2 Stable punctured maps

Define stable punctured maps into completed cobordisms and symplectizations: ordered positive
and negative punctures with orbit and marker data, complex domains, nodes, relative
homotopy/homology labels and their finite automorphism groups (Pardon §2.1, p. 16 and §2.3,
p. 21; BEHWZ §3, p. 7). Construct normalization and domain deformations (Pardon §§2.6–2.7,
pp. 26–27). In the contact core use connected genus-zero maps with one positive end and any
finite number of negative ends, including planes (Pardon §1.2, p. 3). Define the target
translation quotient where ℝ acts, and identify the remaining isotropy; an ℝ-quotient is not a
finite group quotient.

- A map is stable when every component with trivial image has a stable domain, and every
  constant component in a symplectization level is excluded from the contact-core carrier.
- The automorphism group of a stable punctured map is finite.
- Relabelling the negative punctures by a permutation acts on the moduli space, and the
  unlabelled moduli space is the quotient.

**Checks.**

- A trivial cylinder over γ in the symplectization has automorphism group ℤ/κ_γ after the
  ℝ-quotient and is excluded from the smaller compactification of 1.5 but present in 1.4.
- A plane asymptotic to γ has one positive puncture and no negative ones; a definition requiring
  a negative puncture would miss the constant terms of Layer 5.
- A genus-zero map with two positive punctures is not in the contact core but is in the
  Layer 7 and 8 carriers.

*Needs:* Layer 0.1; ContactGeometry CG4; HeegaardFloer §4.1 (F2.1).

### 1.3 Energy, Stokes and asymptotic convergence

Construct the Hofer energy of a punctured map in a symplectization (BEHWZ §5.3, p. 22) and its
cobordism-core extension (BEHWZ §6.1, p. 31). Prove positivity, the end Stokes formula, action
bounds, and the exclusion of nonconstant closed components in the exact case (EGH Proposition
1.6.4, p. 16, and Proposition 2.2.1(c) with inequality (18), p. 48). Prove finite-energy
exponential convergence to the specified nondegenerate orbit, with phase, marker and coordinate
comparisons, from the end equation, the spectral estimates of 1.1 and the nonlinear remainder
control of Pardon §2.8 (p. 28), first locally and then with the bounded-family uniformity used in
the gluing of Layer 3. A genuine Reeb end is not a removable puncture under a finite ordinary-area
hypothesis. The raw energy compactness and this local convergence consume no generic surjectivity
of multiply covered problems.

- The energy of a map is at least the sum of the actions of its positive orbits minus that of
  its negative orbits, with equality in a symplectization.
- A finite-energy end converges exponentially at the rate of the first nonzero eigenvalue of
  the asymptotic operator, in the weighted norm of 1.1.
- Tameness on the core gives the positive lower bound on energy per nonconstant component.

**Checks.**

- The trivial cylinder has energy equal to the action of γ on each end's contribution and total
  dλ-energy zero; an energy definition using the integral of d(e^s λ) would be infinite.
- A plane in an exact cobordism with positive orbit γ has energy equal to the action of γ, and
  this is positive; in a nonexact cobordism a closed sphere can have positive energy with no
  punctures, which is the component that exactness excludes.
- A map converging to γ at rate e^(−δ s) with δ below the spectral gap lies in the weighted
  space; one converging at the gap rate exactly does not, which is why δ is chosen strictly
  smaller.

*Needs:* Layers 1.1 and 1.2; HeegaardFloer §3.2 (F1.2), §3.5 (F1.5).

### 1.4 Holomorphic buildings and compactness

Build the topology of holomorphic buildings with level and matching data, domain convergence, neck
stretching and componentwise target translations (BEHWZ §7, pp. 35–37; Pardon §2.9, p. 29). Prove
that the space of buildings of bounded energy and fixed topological type is sequentially compact
and compact Hausdorff, with the finite-type and class statements (BEHWZ §10, Theorems 10.1–10.3, p.
51; Pardon §2.10, p. 32, Theorem 2.27, p. 34). Establish compactness before imposing smooth-J
regularity. In the nonexact statement keep fixed genus, ends and the energy/class window; no finite
global orbit set is asserted across all action levels.

- A building of height k has k levels with matching orbits between consecutive levels and a
  cross-ordering of the matched punctures.
- Energy is additive over levels and components.
- The Gromov topology restricted to buildings of height 1 is the usual C^∞_loc topology on
  compact sets together with convergence at the ends.

**Checks.**

- Neck stretching a cylinder of height 1 along a trivial cylinder gives a building of height 2
  whose second level is the trivial cylinder; the retained-level compactification keeps it.
- A sequence of planes whose energy escapes to a negative end breaks into a plane and a
  cylinder; the limit has height 2 and the same total energy.
- A sequence with genus 1 cannot converge to a building all of whose components have genus 0
  without a cycle of matching edges; the genus law of Layer 7.6 records this.

*Needs:* Layers 1.2 and 1.3; HeegaardFloer §4.3 (F2.3).

### 1.5 The smaller tree-model compactification

For the contact theorem construct Pardon's smaller compactification: omit trivial cylinders and
forget relative vertical positions of components in symplectization levels, as specified by the
tree model (Pardon §1, p. 1, lines on the compactification; §2.1, p. 16 the categories of
strata; §2.4, p. 23 the stratification). Prove its relation to the retained-level building
compactification of 1.4, its cell-like stratification and all codimension-one faces used in
Layer 5. Prove the effect of the forgotten faces on the count comparison rather than
identifying the two compactifications by terminology. Families of cobordisms and composition
necks have their own compactifications and relative faces (Pardon §§1.4–1.5, pp. 6–7).

- The codimension-one strata of the smaller compactification are in bijection with the terms
  of the master equation.
- The forgetful map from the building compactification to the tree model is continuous and
  surjective with connected fibres.
- Trivial cylinders are absent: every vertex of the tree carries a nontrivial curve.

**Checks.**

- The building "plane over γ, trivial cylinder over γ" in the retained-level model maps to the
  single plane in the tree model; a comparison that counted the trivial cylinder as a
  codimension-one face would double the boundary.
- Two curves in one symplectization level at different heights and the same two curves at equal
  heights give the same point of the tree model.
- A tree with one positive edge and two negative edges has exactly the codimension-one faces
  obtained by splitting at one vertex.

*Needs:* Layer 1.4.

### Examples

- The trivial cylinder, the plane and the cylinder between two orbits as the three basic
  punctured maps, with their energies and automorphisms.
- A one-parameter family of cobordisms whose neck stretches: the limit building and its faces.
- The nonexact closed sphere of positive energy, the component excluded by exactness.

### Dependencies

Layer 0; ContactGeometry CG4; HeegaardFloer §3.2 (F1.2), §3.3 (F1.3), §3.4 (F1.4), §3.5
(F1.5), §4.1 (F2.1), §4.3 (F2.3).

## Layer 2: Weighted nonlinear Reeb-end analysis and the index

### 2.1 Weighted Banach charts and the Cauchy–Riemann section

Construct the weighted Banach charts around a punctured map and the nonlinear Cauchy–Riemann
section with explicit differentiability budgets, its derivative and adjoint, the elliptic
bootstrap and compact inclusions on localized regions (Pardon §2.11, p. 34, Definition 2.34,
p. 35, and Definition 2.36, p. 36; HeegaardFloer §3.5). Use map variations and compactly supported
domain-complex-structure variations, quotiented by the infinitesimal automorphisms.

- The linearized operator at a map is Fredholm between the weighted spaces of 1.1 for every
  admissible weight.
- Its kernel and cokernel are independent of the weight within the gap interval.
- The bootstrap raises regularity on compact regions without changing the end weight.

**Checks.**

- At the trivial cylinder the linearized operator is ∂s−A_γ on the normal bundle plus the
  tangential ℝ⊕ℝ directions, with kernel of dimension 2 in the unweighted limit and 0 for a
  small positive weight on both ends.
- An elliptic bootstrap applied to a W^(1,2) solution gives W^(k,2) for all k on compact sets;
  the end weight is unchanged.
- A variation of the domain complex structure supported near a node changes the operator by a
  compactly supported term.

*Needs:* Layer 1.1, 1.2; HeegaardFloer §3.1 (F1.1), §3.2 (F1.2), §3.5 (F1.5).

### 2.2 Slices, stabilization and infinitesimal automorphisms

Construct all slice and stabilization comparisons between the normal section and the full
tangent domain; a normal section alone is not the whole tangent domain (Pardon §§2.6–2.7,
pp. 26–27 and §2.14, p. 44). Prove the bounded-family uniformity of the asymptotic convergence
of 1.3 used in gluing.

- The tangent space of the unparametrized moduli problem is the quotient of map variations by
  the infinitesimal automorphisms of the domain.
- A slice is a complement to the automorphism orbit, locally transverse.
- Stabilizing by marked points identifies the slice with a fibre of the forgetful map.

**Checks.**

- A plane has automorphism group the affine maps of ℂ, of real dimension 4 before the
  ℝ-translation quotient; the Fredholm index of 2.3 subtracts these from the unquotiented count.
- A cylinder has a one-dimensional rotation and one-dimensional translation automorphism group;
  adding one marked point kills the rotation.
- A genus-two domain with no punctures has finite automorphisms and needs no stabilization.

*Needs:* Layers 1.3, 2.1.

### 2.3 The punctured index formula and determinant gluing

Instantiate the punctured Fredholm index and the determinant-line gluing of HeegaardFloer §2.2
and §3.5 for Reeb ends. In the conventional SFT normalization the unquotiented virtual
dimension of a connected genus-g map with k⁺ positive and k⁻ negative ends is

`(n−3)(2−2g−k⁺−k⁻) + 2c₁^τ(u*TX) + Σ⁺ CZ^τ_SFT − Σ⁻ CZ^τ_SFT`

(EGH Proposition 1.7.1, p. 16; Pardon (2.50), p. 40). Construct the domain-deformation
contribution and prove this formula from HeegaardFloer §3.5 (F1.5). Compare actual linearized
Reeb paths with the F1.4 normalization CZ_HF=−μ_RS: prove the crossing/trivialization
dictionary before replacing a CZ_SFT symbol by −CZ_HF. Retain relative c₁, cap and recapping
data. Subtract each genuinely free target-translation factor and add the family dimensions:
the virtual dimension of a tree type is its index minus the number of symplectization vertices
plus the dimension of the parameter space (Pardon Definition 2.43, (2.52), p. 40); do not
subtract one for every arbitrary disconnected building. Prove the index and orientation
comparisons for trivial cylinders, planes and broken configurations, and the independence of
the full index from τ.

- The index is additive over the vertices of a tree.
- Changing the trivialization τ by winding w on a positive end changes CZ^τ by 2w and c₁^τ by
  −2w, so the total is unchanged.
- The determinant line of a glued operator is the tensor product of the determinant lines of
  the pieces, in the displayed order.

**Checks.**

- The trivial cylinder (g=0, k⁺=k⁻=1): index (n−3)·0+0+CZ−CZ=0; after subtracting its
  symplectization vertex, vdim −1, consistent with its exclusion from rigid counts.
- A plane (g=0, k⁺=1, k⁻=0): index (n−3)+CZ⁺(γ)+2c₁, which for n=3 and 2c₁=0 is CZ(γ).
- Pardon's one-positive tree with vertices (g=0, one positive end, k⁻ negative ends):
  (n−3)(1−k⁻)+CZ⁺−ΣCZ⁻+2c₁, which agrees with Pardon (2.50).
- The small rotation witness: a path exp(tJS) with S=−εI, ε>0 small, has CZ=+1 in the F1.4
  normalization, so CZ_SFT of that path in the opposite convention is −1.

*Needs:* Layers 1.1, 2.1, 2.2; HeegaardFloer §2.2 (F0.0), §3.4 (F1.4), §3.5 (F1.5).

### Examples

- The trivial cylinder: kernel, index and determinant line, with the two ℝ-directions.
- A plane in ℂ² asymptotic to a Hopf circle of the irrational ellipsoid: index computed from
  CZ=3 with n=2.
- A cylinder between γ and its double cover: index CZ(γ²)−CZ(γ) in a common trivialization.

### Dependencies

Layer 1; HeegaardFloer §2.2 (F0.0), §3.1 (F1.1), §3.2 (F1.2), §3.4 (F1.4), §3.5 (F1.5).

## Layer 3: Stabilization, local gluing and orientation descent

### 3.1 Augmented operators and stabilization

Construct incidence stabilization and finite-dimensional compactly supported obstruction
spaces, equivariantly under the retained finite groups (Pardon §3.7, p. 55). Prove surjectivity
of the augmented operator by adjoint elliptic regularity and unique continuation, retaining the
allowed support region (Pardon §2.14, p. 44). Generic somewhere-injective regularity has its
stated witnesses from HeegaardFloer §4.4 (F2.4); covered curves use the augmented construction,
not a claim of generic regularity for all covers.

- For every map there is a finite-dimensional space of compactly supported perturbations whose
  sum with the image of the linearized operator is everything.
- The obstruction space can be chosen inside any prescribed nonempty open subset of the domain
  (Pardon §2.11, p. 34, the unique-continuation statement).
- The augmented operator is equivariant under the automorphism group when the obstruction
  space is.

**Checks.**

- A somewhere-injective regular curve needs obstruction space 0.
- The double cover of a rigid regular plane has cokernel of positive dimension in general, so
  an obstruction space of that dimension is needed; a claim of generic regularity would be false
  here.
- An obstruction space supported away from the ends is unchanged by changing the weight.

*Needs:* Layers 2.1–2.3; HeegaardFloer §3.2 (F1.2), §4.4 (F2.4).

### 3.2 Pregluing, estimates and the local gluing homeomorphism

For a specified surjective augmented problem build pregluing, calibrated kernel comparisons,
uniform right inverses in the chosen neck/end norms, quadratic estimates, Newton correction and
converse recovery/uniqueness (Pardon §§5.1–5.3, pp. 78–94). Include node and Reeb matching
parameters, domain deformations and family directions. Prove the resulting local
homeomorphism with the cell-like gluing space, nodal complex parameters, free real parameters
and obstruction directions, and its compatibility with forgetting auxiliary obstruction spaces
and stabilizations and with group actions. No globally smooth corner structure is inferred
from these topological charts.

- The gluing map is a homeomorphism from a neighbourhood of the boundary in the gluing-parameter
  space onto a neighbourhood in the thickened moduli space.
- Its restriction to a fixed gluing parameter is a diffeomorphism onto a regular thickened
  stratum.
- Two gluings that differ by a matching-marker rotation give the same glued map.

**Checks.**

- Gluing a plane to a trivial cylinder along γ with gluing parameter R returns the plane as
  R→∞, up to translation; the chart is the identity on the plane's stratum.
- Gluing along an orbit of multiplicity κ has κ matching choices, acted on by ℤ/κ; a chart that
  forgot the marker would be κ-to-one.
- The quadratic estimate fails without a uniform right inverse: the broken configuration of two
  planes joined along a bad orbit has a right inverse only after the obstruction space is added.

*Needs:* Layers 2.1–2.3, 3.1; HeegaardFloer §4.5 (F2.5).

### 3.3 Orientation descent and count formulas

Construct the determinant orientation gluing of 2.3 and compare it with the topological virtual
orientation line (Pardon §5.4, p. 94 and §2.13, p. 41, Definition 2.50 of o_T). Order the
source/domain, translation/marker, obstruction, normal and parameter factors explicitly.
Construct the cyclic marker actions and prove good-orbit descent and bad-orbit cancellation in
the boundary diagram, which is the comparison of 0.2 with the curve orientations. Derive the
labelled/unlabelled count formulas, the negative-end permutation denominators and the
intermediate covering factors (Pardon §1.2, p. 3, the coefficient in the differential). Prove
the formula for repeated negative orbits, including odd repetitions. A single unexplained
1/|Aut| factor is not a substitute for these comparisons.

- The orientation of a glued moduli space is the product of the orientations of the pieces, the
  gluing parameter and the matching marker, in that order.
- Relabelling two negative ends with the same orbit of parity ε multiplies the orientation by
  (−1)^ε.
- A bad orbit at a matching edge contributes a count that cancels against its marker rotation.

**Checks.**

- A simple orbit: marker group trivial, no denominator.
- The double cover of a good orbit at a negative end: the two markers give the same glued curve
  with the same sign, denominator 2.
- A bad orbit at a negative end: the two markers give opposite signs, total zero, which is why
  bad orbits are excluded from V.
- Two negative ends on the same odd orbit: swapping them gives the sign −1 and the labelled
  count is twice the unlabelled one with sign, so the unlabelled coefficient of q_γ² in the
  supercommutative algebra is zero, consistent with q_γ²=0 for odd γ.

*Needs:* Layers 0.2, 0.3, 2.3, 3.2; HeegaardFloer §2.2 (F0.0).

### Examples

- Gluing a cylinder to a plane along a simple orbit, with the orientation computed in the
  displayed factor order.
- The double cover of a plane along a hyperbolic orbit: obstruction space, gluing with two
  markers, and the resulting denominator.
- A broken configuration along a bad orbit with the cancelling pair of markers.

### Dependencies

Layers 0 and 2; HeegaardFloer §2.2 (F0.0), §3.2 (F1.2), §4.4 (F2.4), §4.5 (F2.5).

## Layer 4: Contact implicit atlases

### 4.1 Thickenings and the atlas axioms

For a bounded contact tree type T (Layer 1.5) with compact moduli problem M(T), construct the
contact thickening data (Pardon §3.3, pp. 49–50, Definitions 3.9–3.12): a number r_α of added
marked points constrained to a compact codimension-two submanifold D_α, the obstruction
representation E_α=ℝ^(n_α) of the covering group S_(r_α), and an equivariant perturbation
term ν_α of the Cauchy–Riemann equation depending on the added points, with the cylindrical and
cobordism variants of Setups I–IV; the index sets Ā(T) (§3.4, pp. 50–52, Definitions
3.13–3.16); the thickened moduli spaces M(T)_I for finite I⊆Ā(T), Hausdorff in the Gromov
topology, acted on by the product of the covering groups, with the identification of the empty
thickening with M(T) and the regular trivial-isotropy loci (§3.5, pp. 52–55, Definitions
3.17–3.22); and the tautological Kuranishi maps, the open footprints and the forgetful
footprint maps from the zero loci of the extra Kuranishi maps (§3.6, p. 55). Prove that these
data form an implicit atlas of virtual dimension vdim(T) on M(T) in the sense of
ImplicitAtlases §1.1 (Pardon Theorem 3.23, p. 55): the compatibility axioms (footprint maps
compose and the identity one is the identity, Kuranishi maps are compatible with footprint
maps, the footprint of a union is the intersection of the footprints, and a footprint map
induces a homeomorphism from the zero locus modulo the extra covering group onto the
footprint) from the definitions (§3.6, p. 55); the covering axiom by stabilization of curves
(§3.7, pp. 55–57); and the openness of the regular loci, the freeness of the extra covering
group on their preimages and the local product models, in which the regular part of a
thickening is a topological manifold with boundary of dimension vdim(T) plus the obstruction
dimension, by the local models of §3.8 (pp. 57–58), which use the gluing of Layer 3. Prove
that the atlas is locally orientable in the sense of ImplicitAtlases §3.1, with virtual
orientation sheaf the locally constant sheaf of the orientation line o_T of Layer 2.3, from the
equivariant orientation of the regular loci with respect to o_T tensored with the obstruction
line (Pardon Definition 3.2(ix), p. 47, and (2.64), p. 45), so that the engine's orientation
hypothesis holds. Give the atlas with boundary of ImplicitAtlases §1.2 by taking as boundary
the union of the strata of positive codimension (Pardon Definition 3.3 and Remark 3.4, p. 47).
Include compact parameter families (Setups III–IV) and the identification of the boundary faces
with product atlases of the pieces, with the cell-like face structure and normal orientation
lines of the local models (Pardon §3.2, Lemmas 3.5–3.6, p. 47). The existence of a Fredholm
section alone is not an implicit atlas.

- The thickened moduli space for a finite set of thickening data is a topological manifold with
  boundary near its regular locus, of the expected dimension.
- The zero-fibre map from a larger thickening to a smaller one is the restriction to the zero
  set of the extra obstruction section.
- The atlas is compatible with the ℤ/κ marker actions.

**Checks.**

- A regular rigid somewhere-injective plane has an atlas with a single empty thickening, and
  the virtual count is the signed count.
- The double cover of a rigid plane has an atlas whose smallest thickening is nonempty; an
  "atlas" with only the empty thickening would not cover its zero set.
- A family over [0,1] has a boundary atlas whose faces are the atlases at the endpoints.

*Needs:* Layers 1.5, 2.3, 3.1–3.3; ImplicitAtlases §§1.1, 1.2, 1.4, 3.1.

### 4.2 Category-stratified atlases and the virtual fundamental cycle package

The strata of M(T) are indexed by the category S_(/T) of tree types over T, whose objects are
the degenerations T′→T, whose closed strata are the images of M(T′)/Aut(T′/T) and are in
general not embedded, and which is not a poset: exchanging two identical lower vertices of a
degeneration is a nontrivial automorphism over T (Pardon Definitions 2.2–2.3 and Figure 6,
p. 20; Definition 2.13 and (2.5), p. 23). The engine of ImplicitAtlases §6.1 stratifies by a
finite poset; this roadmap owns the extension. Define a cell-like stratification by a finite
category 𝒯 with a final object whose undercategories 𝒯_(t/) are posets, with a dimension function
that increases strictly along non-isomorphisms, orientation lines o_t of parity dim t on the
isomorphisms of 𝒯, and normal identifications o_t⊗o_ℝ≅o_(t′) for codimension-one morphisms
(Pardon §3.1 and Definition 3.1, pp. 45–46), and define an oriented implicit atlas with
cell-like stratification by 𝒯 (Pardon Definition 3.2, pp. 46–47): the data of ImplicitAtlases
§1.1 together with invariant stratifications of every thickening by 𝒯, identified on zero loci
with the pullbacks along footprint maps compatibly in triples, and the submersion axiom that
the regular locus of each thickening is cell-like of dimension dim t plus the obstruction
dimension and oriented by o_t tensored with the obstruction line. When 𝒯 is a poset this is
the notion of ImplicitAtlases §§6.1–6.2 with its normal lines. Prove that the contact atlas of
4.1 is such an atlas for the finite category of effective tree types over T (Pardon Definition
4.4, p. 63) with dim(T′→T)=vdim(T′) and the orientation data of (3.1)–(3.3) (Pardon §3.2,
Lemmas 3.5–3.6, p. 47, and Theorem 3.23, p. 55), and that each closed stratum inherits the
restricted atlas of dimension vdim(T′) from the thickenings (M(T)_I)_(/T′) (Pardon §4.1.3,
p. 60). Construct the category-stratified virtual complex: the sum over objects t of the
virtual complexes of the closed strata relative to their boundaries (ImplicitAtlases §2.3),
twisted by o_t^∨⊗o_(t_max), with the invariants of the finite automorphism groups Aut(t) taken
over ℚ (ImplicitAtlases §0.3), with differential the internal one plus the pushforwards along
the codimension-one morphisms contracted with the normal orientation (Pardon (4.12), p. 61;
Pardon 2016 Definition 6.2.2, p. 49), and its K-presheaf version on compact subsets ((4.14),
p. 61). Prove that it is a pure homotopy K-sheaf whose degree-zero sheaf is the constant sheaf
o_(t_max), so that its cohomology is the Čech cohomology of M(T) with coefficients in o_T
((4.13)–(4.15), p. 61): the homotopy K-sheaf property and purity pass from the strata
(Pardon 2016 Lemma A.2.11, p. 118; ImplicitAtlases §0.8), and the filtration by dimension, the
stratum-by-stratum descent and the local generator cycles are those of the poset argument of
ImplicitAtlases §6.3 (Pardon 2016 Proposition 6.2.3, p. 50) applied to the poset
undercategories, which is the extension Pardon indicates (p. 61).

Apply the engine of ImplicitAtlases to the contact atlas Ā(T) of 4.1, with boundary the strata
of positive codimension: the virtual cochain complex relative to the boundary and the
obstruction complex (§§2.3, 4.1); the global relative trace, which is Pardon's chain-level
virtual fundamental cycle (§4.2; (4.2)–(4.3), p. 59); the comparison of its cohomology with
the Čech cohomology of M(T) with coefficients in the extension by zero of o_T from the
interior, using the local orientability of 4.1 (§3.4; (4.4), p. 59); the virtual fundamental
class of M(T) as the resulting ℚ-linear functional on the Čech cohomology of degree vdim(T),
together with the subatlas comparison maps for finite Ā′⊆Ā″⊆Ā(T), which compose as expected
and are compatible with the traces, so that the class is independent of the finite subatlas and
is defined for the infinite index set Ā(T) through them (§4.3; (4.6)–(4.7), p. 59); and the
product map for two contact atlases, compatible with the traces and the subatlas maps and
inducing the Künneth product on Čech cohomology (§§6.4–6.5; (4.16)–(4.18) and Lemma 4.3,
pp. 61–62). Prove that when M(T) is its own regular trivial-isotropy locus the functional is
evaluation on the ordinary fundamental class (§5.6; Pardon Lemma 4.2, p. 59). Every
application is to the atlases of 4.1 on the contact moduli problems; nothing is stated for an
arbitrary compact Hausdorff space with an implicit atlas.

- The virtual class of M(T) is a ℚ-linear functional on the Čech cohomology of M(T) in degree
  vdim(T) with coefficients in the extended orientation line, unchanged under enlarging the
  finite subatlas.
- The category-stratified complex computes the Čech cohomology of M(T) with coefficients in
  o_T, absolute rather than relative to the boundary, and for a poset stratification it is the
  complex of ImplicitAtlases §6.3.
- Under the Künneth product, the virtual class of a product atlas is the product of the virtual
  classes.

**Checks.**

- A regular rigid curve with trivial isotropy: M(T) is a point, the atlas of 4.1 can be taken
  with the empty thickening only, the Čech cohomology is ℚ in degree 0, and the functional is
  evaluation on the fundamental class of the oriented point, ±1 in the dual of o_T
  (ImplicitAtlases §5.6); a package whose functional on such a point were not ±1 would be
  misnormalised.
- Enlarging a finite subatlas by one thickening datum changes both complexes but not the
  functional, through the subatlas comparison of ImplicitAtlases §4.3; a count read from a
  single thickening without that comparison would depend on the choice.
- For a degeneration T′→T of codimension one whose two lower vertices are identical,
  Aut(T′/T)=ℤ/2 (Pardon Figure 6, p. 20), so the index category is not a poset and the
  stratified complex takes the ℤ/2-invariants of the stratum; the face then contributes half of
  its own class to the boundary, the factor 1/|Aut(T′/T)| of (4.23), p. 63. A stratified
  complex without the invariants would count the face twice, and the poset complex of
  ImplicitAtlases §6.3 does not apply to this index category.

*Needs:* Layers 2.3, 4.1; HeegaardFloer §2.2 (F0.0); ImplicitAtlases §§0.3, 0.7, 0.8, 0.9,
2.3, 3.4, 4.1–4.3, 5.6, 6.1–6.5.

### 4.3 Restriction, product and concatenation diagrams and normalization

Construct compatible restriction, product, stabilization and tree-concatenation diagrams of
atlases (Pardon §4.9, p. 76, the symmetric monoidal structure on the sets of thickening data).
Auxiliary choices compare through specified common atlases, refinements or concordances;
different arbitrary atlases on the same zero set need not have equal virtual weights. Apply the
package of 4.2 to these inputs, with the refinement, disjoint-union and product laws of
ImplicitAtlases §§5.3, 6.4–6.5. Prove the regular-locus count normalization (ImplicitAtlases
§5.6; Pardon Lemma 4.2, p. 59) and the contact orientation comparison, including the
tree-automorphism factors of the boundary and concatenation laws ((4.23)–(4.24), p. 63) and
the boundary-normal signs.

- Concatenating the atlases of two trees along a matching edge gives an atlas of the
  concatenated tree whose boundary face is the product atlas.
- A refinement of thickening data induces an isomorphism of virtual classes.
- On the regular locus the virtual class is the fundamental class with the orientation of 3.3.

**Checks.**

- Two regular rigid curves concatenated along a simple orbit: the product atlas has virtual
  count the product of the two signed counts.
- A codimension-one face with a tree automorphism of order 2 enters the boundary identity with
  the factor 1/2; a normalization that ignored the automorphism would double that term.
- Concordant atlases on the same zero set give the same count; two unrelated atlases need not,
  so the comparison is through the concordance, not by equality of zero sets.

*Needs:* Layers 4.1, 4.2; ImplicitAtlases §§5.2–5.4, 6.4, 6.5.

### Examples

- The atlas of a rigid plane and of its double cover.
- The concatenation of two cylinder atlases along a simple orbit and the boundary face.
- A one-parameter family of cobordisms with its boundary atlas.

### Dependencies

Layers 1, 2 and 3; HeegaardFloer §2.2 (F0.0); ImplicitAtlases Layers 0–6.

## Layer 5: Coherent counts, the differential and the exact functor

### 5.1 Tree-indexed chain-level diagrams

Construct the tree-indexed chain-level virtual diagrams for symplectizations, exact cobordisms,
their one-parameter deformations and stretched compositions (Pardon §§4.3–4.8, pp. 63–76, the
S-modules and the sets Θ). Retain disconnected configurations needed for the family
homotopies. Construct the comparison maps and the inversions of quasi-isomorphisms used to
choose coherent relative representatives, and prove compatibility with tree concatenation,
products, boundary incidence, obstruction generators and auxiliary-choice comparisons. The
cohomology-level virtual class of 4.2 alone supplies none of these strict diagram
choices. Prove their required homotopies and independence on homology.

- A coherent system assigns to every tree type a relative virtual cochain with boundary the sum
  over codimension-one faces of the products of the pieces.
- Two coherent systems for the same data are homotopic through coherent systems.
- A coherent system for a family restricts to coherent systems at its endpoints.

**Checks.**

- For a tree with one vertex and no faces the coherent datum is a single cochain class, the
  virtual count of 4.3.
- For a tree with one matching edge the boundary identity reads ∂(count of the glued type) =
  ±(count of the first piece)·(count of the second piece), the two-term master equation.
- A family of cobordisms gives a homotopy whose boundary is the difference of the endpoint
  counts, the chain-homotopy identity of 5.3.

*Needs:* Layers 4.1–4.3; ImplicitAtlases §§2.3, 4.3, 6.3.

### 5.2 Counts and the contact differential

Extract the rational orientation-line counts from the coherent system. Prove finite output for
each generator in the exact case, the signed boundary identity with all marker/permutation
factors of 3.3, and its equality with d² on a generator (Pardon §1.2, pp. 3–4 and §1.6,
Theorem 1.1, p. 7). Define d on generators by the counts of rigid one-positive-end genus-zero
curves in the symplectization, with the negative orbits as the output word, and extend it to
A(V) by 0.5, proving d is odd, d(1)=0, the signed Leibniz rule and d²=0. Planes contribute
length-zero terms and are retained. Prove independence of temporary orientation bases and the
integer/cohomological DG comparison of 0.4.

- d has odd parity and degree −1 in an integer lift.
- The coefficient of the word q_Γ in d(q_γ) is the count of rigid curves from γ to Γ divided by
  the permutation and covering factors of 3.3.
- d²=0 is the identity "the signed count of codimension-one faces of a one-dimensional moduli
  space is zero", read on generators.

**Checks.**

- A hypertight form has no planes, so d(q_γ) has no constant term.
- The irrational ellipsoid boundary has all generators even, so d has odd degree between even
  generators and vanishes (Layer 6.4).
- Projecting d onto its length-one part loses square zero when constant terms are present
  (Layer 6.3): a definition of d omitting planes is not a differential in general.

*Needs:* Layers 0.3, 0.5, 3.3, 5.1.

### 5.3 Exact cobordism maps and the symmetric monoidal functor

Construct unital algebra chain maps for exact cobordisms in the positive-to-negative direction
(Pardon §1.3, pp. 5–6, (1.11), p. 6). Prove the chain-map, identity-cylinder and
stretched-composition relations, with the ordinary chain homotopies supplied by the parametrized
systems of 5.1 (Pardon §§1.4–1.5, pp. 6–7). Prove independence on homology, rescaling comparisons,
contact-form and compatible-J invariance, and naturality under contactomorphisms. Give the
deformation category of exact cobordisms and prove the resulting symmetric monoidal functor to
parity-supercommutative ℚ-algebras (Pardon §1.7, (1.22), pp. 8–9). Construct the empty-object/unit,
disjoint union/tensor product, symmetry and composition coherence maps, using the comparison of 0.4
for the tensor structure. Ordinary chain homotopy is the scope of this assertion.

- The cobordism map sends q_γ⁺ to the sum over rigid curves in the completed cobordism with
  positive end γ⁺ of the output words, with the factors of 3.3.
- The identity cylinder induces the identity on homology.
- The map of a composition is chain homotopic to the composition of the maps.

**Checks.**

- The empty contact manifold maps to ℚ, the unit of the tensor product.
- A disjoint union Y₁⊔Y₂ has contact algebra A(V₁)⊗A(V₂) with the Koszul symmetry of 0.4; the
  symmetry isomorphism sends a⊗b to (−1)^(|a||b|)b⊗a.
- The trivial cobordism with a rescaled form gives the identity on homology, not merely a
  quasi-isomorphism.

*Needs:* Layers 0.4, 5.1, 5.2.

### Examples

- The contact homology of the irrational ellipsoid boundary (Layer 6.4), with its functoriality
  under the sphere comparison.
- The two cobordism maps of a one-parameter family and their chain homotopy.
- A stretched composition and its comparison with the composite map.

### Dependencies

Layers 0, 3 and 4.

## Layer 6: Augmentations, linearization and computations

### 6.1 Augmentations and the linearized complex

For a chain algebra augmentation ε:A→ℚ prove that I=ker ε and I² are d-stable and construct
the linearized complex I/I². Prove its differential formula, basis independence, functoriality
for augmentation-preserving maps and the integer/parity comparisons. Construct the stronger
algebra-homotopy data needed for augmented invariance and prove invariance under that data
(Pardon §1.8, pp. 14–15, the distinction between chain homotopy and DGA homotopy). The ordinary
chain homotopies of 5.3 are not assumed to possess this strengthening. Exact-filling
augmentation comparisons have their additional coherent family/count data as hypotheses.

- The linearized differential on I/I² is induced by the length-one part of d composed with the
  augmentation on the other factors.
- An augmentation-preserving chain algebra map induces a chain map of linearized complexes.
- Two augmentations related by a DGA homotopy give isomorphic linearized homologies.

**Checks.**

- An augmentation must send every constant term d(q_γ)|_(length 0) to zero: for da=1 no
  augmentation exists (6.3).
- For d=0 every linear functional vanishing on products is an augmentation, and the linearized
  complex is V with zero differential.
- A chain homotopy that is not a DGA homotopy need not preserve augmentations; the invariance
  theorem has the stronger hypothesis.

*Needs:* Layers 5.2, 5.3; DGAInfinity Layer 1.

### 6.2 Hypertight forms and cylindrical contact homology

For hypertight forms prove the absence of plane-rooted boundary branches, construct the
cylindrical complex and compare it with the length-one part of the contact construction
(Pardon §1.8, p. 12, cylindrical contact homology). Give the asymptotically hypertight filtered
version with its cofinal compatibility and limit maps. No augmentation sending every generator
to zero is used without proving its constant-term condition.

- Without contractible orbits there are no planes, so d preserves word length.
- The cylindrical differential is the length-one part of d and squares to zero.
- The cylindrical homology is the linearized homology at the zero augmentation.

**Checks.**

- A unit cotangent bundle of a hyperbolic surface with a geodesic-flow form is hypertight; its
  cylindrical complex is generated by closed geodesics.
- The irrational ellipsoid is not hypertight (every orbit is contractible), and the cylindrical
  complex is not defined by this route; d=0 there holds for the parity reason of 6.4.
- The zero augmentation is an augmentation exactly when d has no constant terms.

*Needs:* Layers 5.2, 6.1.

### 6.3 Algebra examples

Prove the algebra examples da=bc, db=dc=0 with a odd and b, c even, and the constant-term
example da=1. In the latter construct a contracting homotopy, deduce zero homology and prove
that there is no unital chain augmentation to ℚ. Show why projecting an arbitrary contact
differential onto its length-one part can lose square zero when constant terms are present.

**Checks.**

- da=bc: d²a=d(b)c+bd(c)=0, so d is a differential; the homology contains the classes of b and
  c and the class of bc is zero.
- da=1: the map H=m_a (left multiplication by a) satisfies dH+Hd=id on the algebra generated by
  a, since d(ax)=x−a·dx and a·d(x) add to x; homology is zero.
- da=1 and ε(1)=1 force ε(da)=1≠0, so no augmentation.
- Generators a odd of degree 1, w even of degree 0, v odd of degree 1 and u even of degree 2,
  with da=1, dw=0, dv=w and du=v−a·w: on generators d²u=dv−d(a·w)=w−(1·w−a·dw)=0 and
  d²a=d²v=d²w=0, so d²=0 on the whole algebra by 0.5. The length-one projection d₁ has d₁a=0,
  d₁u=v and d₁v=w, so d₁²u=w≠0: a genuine differential with a constant term whose length-one
  part is not a differential.

*Needs:* Layers 0.5, 6.1.

### 6.4 Irrational ellipsoids

For an irrational ellipsoid boundary E(a₁,…,a_n) compute the closed Reeb orbits (the n
coordinate circles and their iterates), periods, covering multiplicities, good-orbit lines and
Conley–Zehnder indices in the chosen trivializations. Prove that every contact generator has
even parity, hence d=0, and identify the rational contact algebra and its grading with their
change-of-trivialization laws (Pardon §1.8, p. 11, the grading |γ|=CZ(γ)+n−3). Derive the
sphere/contact-form comparison through 5.3; the degenerate round form is not an input to a
nondegenerate-orbit count.

- The k-th iterate of the i-th coordinate circle has CZ=(n−1)+2Σ_j ⌊k a_i/a_j⌋ in the standard
  trivialization, which is odd minus even, hence of parity n−1.
- The degree of q_(γ_i^k) is CZ+n−3, of parity 2n−4, even.
- Every orbit is good, since all are iterates of simple orbits with no eigenvalue in (−1,0).

**Checks.**

- n=2, k=1: CZ=3 and |q|=2; the contact algebra is ℚ[q_1,q_2,…] on even generators with d=0.
- Changing the trivialization by winding w shifts CZ by 2w and keeps the parity.
- A definition of d that counted the degenerate round form's orbit circle would not be a count
  of isolated orbits.

*Needs:* Layers 0.1, 0.2, 5.2, 5.3; MorseTheory M1 (Hessian indices of the period function);
HeegaardFloer §3.4 (F1.4).

### Examples

- The linearized homology of a hypertight unit cotangent bundle at the zero augmentation.
- The contact algebra of the irrational ellipsoid in dimension 3 and 5.
- The algebra examples of 6.3 as negative controls.

### Dependencies

Layers 0 and 5; DGAInfinity Layer 1; MorseTheory M1; HeegaardFloer §3.4 (F1.4).

## Layer 7: Multiple-input Poisson and arbitrary-genus Weyl algebra

### 7.1 The normal-ordered coefficient carrier

Construct the normal-ordered coefficient algebra with formal p-words and polynomial
q-coefficients, and then formal nonnegative ℏ powers (Latschev §2.1, p. 2; EGH §2.2, p. 49).
Coefficients are on finite signed orbit monomials; odd p or q repetitions vanish. Prove that
each multiplication and contraction coefficient is a finite sum: for the Weyl product a fixed
output p-word bounds the right p-subword, and the corresponding right q-polynomial bounds the
possible contractions. Prove this finite-support argument also for infinitely many orbit
labels, signs and the ℏ coefficient. Do not complete indiscriminately in both p and q.

- The carrier is the completion in p-word length of the supercommutative algebra on the p and q
  generators, with polynomial q-coefficients.
- Multiplication is bilinear, continuous and associative on it.
- The ℏ-adic extension is the formal power series in ℏ with coefficients in the carrier.

**Checks.**

- A coefficient at p-word of length 2 in a product of two series receives contributions only
  from p-subwords of length at most 2 on the right, finitely many.
- Two series each with infinitely many p-words of length 1 multiply to a series whose
  length-2 coefficients are finite sums, since each output word fixes its two letters.
- An indiscriminate completion in both p and q admits Σ_γ p_γ q_γ over infinitely many orbits,
  whose square has an infinite coefficient sum at the empty word; this is the carrier excluded.

*Needs:* Layer 0.3.

### 7.2 The graded Poisson bracket and the Weyl product

Construct the graded Poisson bracket with {p_γ,q_η}=δ_γη κ_γ and the p's and q's pairwise
commuting, with its Jacobi, Leibniz and continuity laws (Latschev §2.1, p. 2). Construct the
associative Weyl product with the supercommutator relation [p_γ,q_γ]=κ_γ ℏ (EGH (19), p. 49),
the normal-order basis/universal property and the classical-limit comparison. In the integer
lane set |p_γ|=2(n−3)−|q_γ| and |ℏ|=2(n−3) (EGH §2.2, pp. 47–48; Latschev §2.1, p. 2 with
N=n−3), and prove the bracket has degree −2(n−3). Give the parity-only versions without
imposing integer gradability.

- The bracket is a biderivation of the displayed degree, graded antisymmetric, and satisfies
  the graded Jacobi identity.
- The Weyl product reduces to the commutative product modulo ℏ, and its commutator divided by ℏ
  reduces to the bracket.
- Normal-ordered monomials q^I p^J form a topological basis of the Weyl carrier.

**Checks.**

- {p_γ,q_γ}=κ_γ has degree 0 and |p_γ|+|q_γ|=2(n−3), so the bracket has degree −2(n−3), which
  is −2N in Latschev's notation.
- n=1: |ℏ|=2(1−3)=−4, agreeing with EGH Example 2.2.4 for V=S¹ (p. 50); n=3: |ℏ|=0.
- κ_γ=2: [p_γ,q_γ]=2ℏ, and the left representation p_γ=2ℏ∂/∂q_γ gives p_γ(q_γ)=2ℏ; a
  convention omitting κ would give ℏ.
- Two different orbits: {p_γ,q_η}=0 and [p_γ,q_η]=0.

*Needs:* Layer 7.1.

### 7.3 Hamiltonian differentials and the master equations

For an odd rational Hamiltonian h with no p-free part and {h,h}=0, construct the Hamiltonian
differential {h,−} and prove square zero. Construct its iterated-bracket coderivation on the
reduced symmetric coalgebra with the correct shifts and unshuffle signs (Latschev §2.1, pp. 3–4,
the coderivation D_h of an odd h with {h,h}=0 and Lemma 1), and compare its unary operation with
the one-positive contact differential of 5.2. These constructions are conditional on the displayed
Hamiltonian equation and have no unstated analytic hypothesis.

Use the genus-normalized series K=Σ_(g≥0) ℏ^g H_g and H=ℏ⁻¹K. Prove that graded commutators
are ℏ-divisible on the Weyl carrier. From K⋆K=0 derive the well-defined operator D=[K,−]/ℏ,
its continuity and D²=0 (EGH Theorem 2.2.2, p. 49 and (23), p. 50); give the equivalent
Laurent-normalized H formulation. Square zero of an inner differential alone does not imply this
master equation.

- D is an odd derivation of the Weyl product.
- D²=[K⋆K,−]/ℏ² up to the sign conventions, so K⋆K=0 implies D²=0.
- The ℏ⁰ part of D is the Poisson differential {h,−} with h=H_0.

**Checks.**

- h=p_γ q_η q_θ (one input, two outputs) has {h,h}=0 trivially when γ, η, θ are distinct;
  {h,−} sends q_γ to κ_γ q_η q_θ and the length-one contact differential agrees.
- h=θ p₁p₂ with θ odd and even p's: {h,h}=0 since h is q-free; the differential is zero on
  q's.
- K=ℏq_γ with q_γ odd: K⋆K=ℏ²q_γ²=0, D=[K,−]/ℏ=[q_γ,−] has D(p_γ)=±κ_γℏ≠0 and D²=0, so K
  satisfies the master equation although it is p-free. The master equation does not exclude
  p-free terms; the punctured carrier of 7.5 excludes them, and 7.7 keeps them in the vacuum
  sector.

*Needs:* Layers 5.2, 7.2; DGAInfinity Layer 0 (coalgebra and unshuffle signs).

### 7.4 Cobordism potentials and the potential bimodule

Construct cobordism potential modules, left/right endpoint actions and contraction-based
composition, with a proved finite-support domain for every exponential and contraction used. Put
H±=ℏ⁻¹K±. The even cobordism potential has normalization F=ℏ⁻¹Σ_(g≥0) ℏ^g F_g (EGH (36), p. 55) and
integer degree zero when an integer lift is present; prove these from the virtual index. In the
mixed (p⁺,q⁻) module the left negative-end action has q⁻ acting by multiplication and p_γ⁻=κ_γ⁻ ℏ
∂/∂q_γ⁻ with the left super derivative; the right positive-end action has p⁺ acting by right
multiplication and q_γ⁺=κ_γ⁺ ℏ ∂/∂p_γ⁺ with the right super derivative (EGH p. 49, the two
representations). For homogeneous m use ∂R_p m=(−1)^(|p|(|m|−1)) ∂L_p m and prove the
opposite-action and super-bimodule identities. Define D_X(m)=H⁻·m−(−1)^(|m|) m·H⁺ (EGH (41), p. 57)
and prove D_X²=0 from the endpoint master equations (EGH (41) and the sentence following it, p.
57). The potential equation is D_X(exp(F))=0, equivalently H⁻·exp(F)−exp(F)·H⁺=0 for even F (EGH
Theorem 2.3.3, p. 58). Cobordism potentials are not in general multiplicative maps between endpoint
Weyl algebras. Establish the classical rational limit and the one-positive comparison with its
exact multiplicity normalization.

- The bimodule is a left module over the negative Weyl algebra and a right module over the
  positive one, with commuting actions.
- D_X is odd and squares to zero whenever both endpoint master equations hold.
- F has degree 0 and ℏ⁻¹F_0 is its rational leading term.

**Checks.**

- Right versus left super derivative: for m=p·m′ with |p|=1 and |m|=0, ∂R_p m=(−1)^(1·(0−1))∂L_p
  m=−∂L_p m; for |p|=0 the two agree.
- D_X²(m)=H⁻(H⁻m)−(−1)^(|m|)H⁻(mH⁺)+(−1)^(|m|)(H⁻m)H⁺−mH⁺H⁺, since D_X(m) has parity
  |m|+1 and (−1)^(|m|+1)(−1)^(|m|)=−1; the middle terms cancel, so D_X²=0 iff H⁻⋆H⁻ and H⁺⋆H⁺
  act as zero. For even m this reads H⁻H⁻m−mH⁺H⁺, with a minus sign on the last term.
- A trivial cylinder has F=Σ_γ q_γ⁻ p_γ⁺/(κ_γ ℏ) (Layer 9.3) and D_X(exp F)=0 reads
  H⁻·exp F=exp F·H⁺, which is the statement that the two representations of H agree.

*Needs:* Layers 2.3, 7.2, 7.3.

### 7.5 The weighted exact-sector carrier and the potential F>0

For a normal-ordered positive p-word I and integer ℏ exponent N put w(I,N)=N+length(I).
Require a global integer lower bound on w and a q-polynomial coefficient at each (I,N). Thus ℏ
poles may grow with the positive word length; a single global lower bound on N would exclude
exp(F). Prove the weighted carrier's product and endpoint-module laws: contractions preserve
additive w, the right p-word is a subword of a fixed output p-word, and the two lower bounds
make the possible w-values finite; the finitely many right q-polynomials then bound contraction
choices. Include the signs and coefficient topologies in this argument.

In this exact punctured sector write the potentials as H>0 and F>0: every counted connected
domain has at least one positive puncture. There are no p-free summands, standalone connected
closed-map domains or interior marked-form/descendant insertions in this sector, including no
connected stable constant no-end maps; ghost components attached to a counted punctured domain
are retained. Prove that exactness excludes nonconstant no-positive-end components (1.3);
exclusion of standalone constant maps is part of the specified punctured carrier, not a
consequence of the energy identity. Consequently F>0 has positive p-length and w≥0, with the
even parity and genus normalization of 7.4.

- The weighted carrier is a module over the normal-ordered Weyl algebra of 7.2.
- w is additive under the Weyl product on normal-ordered monomials and preserved by each
  contraction.
- exp(F>0) lies in the weighted carrier with w≥0.

**Checks.**

- The term ℏ^(−k)F_0^k of exp(F>0), with k p-factors, has w≥−k+k=0; its N=−k alone is unbounded
  below as k grows.
- One Weyl contraction adds 1 to N and removes one p-letter, preserving w.
- A q-free, p-free scalar of N=−1 has w=−1<0 and is excluded, which is the vacuum term of 7.7.

*Needs:* Layers 1.3, 7.1, 7.4.

### 7.6 Exponentials, composition and the genus law

Construct exp(F>0) in the mixed commutative carrier: its coefficient at positive word I uses only
powers at most length(I). The empty configuration gives its unit term and is distinct from a
geometric vacuum count. Construct the endpoint actions and contraction pairing, proving
preservation of their stated domains. For composition along k≥1 intermediate ends prove that
the weights add, that the finite intermediate q-polynomial bounds k and its orbit labels, and
that g_out=g₁+g₂+k−1 for two connected pieces; a self-loop adds one genus and one ℏ (EGH (78),
p. 67, the operation ⋆; Lemma 2.5.1, p. 68). These prove the endpoint-pairing finiteness and
exponent law independently of asserting closure of the ordinary Weyl product.

- Composition of potentials is associative (EGH Lemma 2.5.1, p. 68).
- exp(F₁)⋆exp(F₂)=exp(F₁₂) for a unique F₁₂ (EGH Lemma 2.5.1(2), p. 68).
- The three-cobordism law for the composed maps (EGH (79), p. 69).

**Checks.**

- k=1: g_out=g₁+g₂; k=2 with two edges between connected pieces: g_out=g₁+g₂+1.
- A self-loop on a genus-0 piece gives genus 1 and multiplies by ℏ, so the ℏ exponent matches
  the genus.
- The identity-cylinder kernel exp(Σ_γ q_γ⁻ p_γ⁺/(κ_γ ℏ)) composed with any F gives F; without
  the factor ℏ⁻¹ the composite rescales q by ℏ (Layer 9.3).

*Needs:* Layers 7.4, 7.5.

### 7.7 The vacuum and closed-map sector

Retain p-free/no-positive-end and marked closed-map contributions as a separately named
vacuum/closed-map sector (EGH §2.2, p. 48, the constant-curve part H_const of H at p=0).
Construct its coefficient families with evaluation/compact-support data. Specify a complete separated
multiplicative filtration in which its even connected vacuum potential has strictly positive
filtration, and prove convergence and the usual identities for its exponential under that
hypothesis. A scalar of zero filtration, or an unweighted ℏ⁻¹ vacuum term, does not satisfy
it. The joint energy/genus/insertion support comparison and the mixed-sector combination and
sewing theorems retain that hypothesis and the virtual compatibility data. The unrefined exact
punctured construction uses F>0; it does not set an independently specified vacuum sector to
zero. Nonexact sectors also retain the class and support data of Layer 9.

- The vacuum potential is the p-free part of the full potential, with its own filtration.
- Its exponential converges in the filtration-complete carrier when the potential has positive
  filtration.
- Its coefficients are the no-positive-end counts of the realization data, labelled by class
  and energy; nothing from the closed stable-map theory enters them.

**Checks.**

- The constant term ℏ⁻¹c with c a scalar has filtration 0 and its exponential does not converge
  in the filtration topology; the filtration hypothesis excludes it.
- A vacuum potential consisting of one term of positive energy e and filtration e: its
  exponential has coefficient e^k/k! at filtration ke, converging.
- The exact punctured sector sets no vacuum term; a closed sphere in a nonexact cobordism of
  positive area is a vacuum term, not a punctured one.

*Needs:* Layers 7.5, 7.6.

### 7.8 Weyl, Fock and curved derived brackets

On the proved joint-admissible coefficient domain let C_Y be the completed q-symbol module and
m_f multiplication by f. Use the normal-order representation q_γ↦m_(q_γ), p_γ↦κ_γ ℏ ∂/∂q_γ (EGH
p. 49) and define Q_Y(g)=H_Y·g. Prove Q_Y²=0 from H_Y⋆H_Y=0; distinguish this Fock operator from
the Weyl derivation D_Y=[K_Y,−]/ℏ=[H_Y,−]. Put c_Y=Q_Y(1)=H_Y|_(p=0) (EGH p. 48, H at p=0). The
punctured endpoint theory has c_Y=0; the separately retained vacuum/marked sector need not, and
is not declared pointed by terminology.

Construct the symmetric higher derived brackets l_k(f_1,…,f_k)=[…[Q_Y,m_(f_1)],…,m_(f_k)](1),
with l_0=c_Y and graded commutators. Prove their Koszul symmetry, degree and all curved
identities from Q_Y²=0, including l_1(c_Y)=0 and l_1²(f)+l_2(c_Y,f)=0. In particular
l_1(f)=Q_Y(f)−(−1)^(|f|) f c_Y; a curved unary operation is not silently an ordinary
differential. Keep C_Y, its distinguished unit and its homogeneous closed pieces explicit; no
internal finite-degree direct-sum claim is made for the completion. These are SFT/Fock
specializations of the generic signed multilinear/coalgebra and filtered twisting machinery of
DGAInfinity, not a second generic DG or Maurer–Cartan engine.

- Q_Y is a continuous odd operator on C_Y with Q_Y²=0.
- l_k has degree |H_Y|=−1 in the integer lane for every k, because the normal-order
  representation preserves degree (|κ_γℏ∂/∂q_γ|=|ℏ|−|q_γ|=|p_γ| by 7.2), and is graded
  symmetric. The rational brackets of 9.4, formed from h=H_0 of degree 2(n−3)−1, have degree
  −1−(k−1)·2(n−3) before that section's regrading (Latschev §2.1, p. 3: the k-fold bracket
  map of h has degree |h|−2Nk); the ℏ^(k−1) coefficient of the genus-zero part of l_k is that
  rational bracket evaluated at p=0, the terms in which one input is differentiated more than
  once, or a positive-genus term of H_Y enters, carrying higher powers of ℏ.
- The l_k are the Taylor coefficients of the curved L∞ structure whose Maurer–Cartan equation
  is Q_Y(exp a)=0.

**Checks.**

- l_1(f)=[Q,m_f](1)=Q(f)−(−1)^(|f|)fQ(1)=Q(f)−(−1)^(|f|)f c_Y.
- l_1(c_Y)=Q²(1)+c_Y²=0, since c_Y is odd in a supercommutative algebra and Q²=0.
- c_Y=0: l_1=Q_Y and l_1²=0, the ordinary differential; with c_Y≠0, l_1² equals −l_2(c_Y,−),
  which is the curvature, so a definition declaring l_1 a differential would be wrong.
- Degree witness at n=2, |ℏ|=−2, κ=1: orbits with |q_1|=|q_2|=0 and |q_3|=3, so
  |p_1|=|p_2|=−2, and H_Y=q_3p_1p_2 of degree −1 with H_Y⋆H_Y=0 since q_3²=0. Then
  Q_Y(g)=ℏ²q_3∂_1∂_2g, [Q_Y,m_(q_1)](g)=ℏ²q_3∂_2g and l_2(q_1,q_2)=ℏ²q_3, of degree
  2·(−2)+3=−1=|q_1|+|q_2|−1; a formula |H_Y|−(k−1)|ℏ| would give l_2 degree +1 and
  l_2(q_1,q_2) degree 1.

*Needs:* Layers 7.2, 7.3, 7.7; DGAInfinity Layer 0.

### Examples

- The Weyl algebra of one orbit with κ=1 in dimension n=3: |p|=−|q|, |ℏ|=0, and the
  representation p=ℏ∂/∂q.
- The potential of a trivial cylinder and its exponential, as the identity kernel.
- The two-edge composition producing a handle, with ℏ exponent 1.

### Dependencies

Layer 0.3; Layers 1.3, 2.3, 5.2 (for the comparisons only); DGAInfinity Layer 0.

## Layer 8: Geometric realization and conditional sewing

### 8.1 Realization data on graph-indexed problems

Define realization data on the graph-indexed punctured moduli problems: all permitted
positive/negative ends and genera; compact energy/topology pieces; retained finite isotropy,
nodes, level and marker data; the augmented gluing models; virtual orientation lines; relative
chain systems and trace comparisons; and their graph-concatenation, family and parameter-face
maps (Hind–Siegel §3, p. 5 and §4, p. 11; EGH Proposition 1.7.2, p. 17). Include multiple
matching edges, cycles and genus addition. A contact tree system is not definitionally such a
graph system.

- A graph-indexed datum assigns to every finite graph with legs a compact moduli problem with
  its atlas, orientation line and relative chain system.
- Concatenation along matching edges and the face maps of families are part of the datum.
- The one-positive genus-zero tree systems of Layer 5 embed as the subcategory of trees.

**Checks.**

- A graph with two vertices and two matching edges has first Betti number 1, so its glued
  curve has genus one more than the sum; a datum with no cycles cannot realize it.
- A graph with one vertex, two positive legs and one negative leg is not a tree in Layer 5's
  sense but is a graph here.
- Restricting the datum to trees with one positive leg recovers the contact tree system of
  Layer 5, with the same atlases.

*Needs:* Layers 1.4, 3.2, 3.3, 4.1, 5.1.

### 8.2 The realization assertion and the conditional master equations

State the realization assertion: these data can be constructed coherently for the specified
nondegenerate exact contact/cobordism problems. Treat it as a mathematical statement in its own
right, distinct from the Layer 5 construction. The formalization includes this exact statement
and the conditional theorems below; it does not identify a foundational sketch, an abstract
claiming a construction, or unrelated virtual numbers with a proof of the assertion (Hind–Siegel
§5, p. 15; Ishikawa's Kuranishi construction, abstract, p. 1, is a distinct approach and is not
substituted for the contact-specific atlas and compatibility proofs here).

Given those data, prove the raw signed codimension-one boundary and Stokes identities,
coefficient finiteness and orientation/covering comparisons (EGH Theorem 2.2.2, p. 49, the
boundary of the moduli space tiled by height-two buildings). Derive {h,h}=0 and K⋆K=0 from
those identities, rather than adding the master equations as unspecified fields of the
geometric datum. Derive the cobordism-potential equation (EGH Theorem 2.3.3, p. 58), gluing,
parameter homotopies and invariance under the supplied coherent comparisons, and apply Layer 7.
Prove the agreement with Layer 5 only after constructing the smaller-contact/full-building
comparison of 1.5 and showing that every extra boundary contribution has the asserted effect.

- The boundary of a one-dimensional graph-indexed moduli space is the signed sum over
  height-two splittings with the κ matching factors.
- K⋆K=0 is the generating-series form of this boundary identity over all graphs.
- The potential equation D_X(exp F)=0 is its form for a cobordism, with disconnected curves
  generating exp F.

**Checks.**

- The two-term splitting of a genus-zero curve with one positive end recovers d²=0 of 5.2 after
  the 1.5 comparison.
- A curve with two positive ends splitting along both gives a term quadratic in H, which is the
  ℏ-divisible commutator of 7.3.
- A splitting along two matching edges contributes to the ℏ¹ part of K⋆K, the genus-one term.

*Needs:* Layers 1.5, 5.2, 7.3, 7.4, 8.1.

### 8.3 Multiple-input and higher-genus examples

Construct the genus-zero multiple-input and higher-genus examples of the formalism: two inputs
joining one output, one input splitting into two, and two matching edges producing a handle.
Compute their graph automorphisms, genus/ℏ exponents, multiplicity and orientation contractions.
These demonstrate the loop fusion/separation idea on indexed data, without claiming every
formal graph has a nonzero holomorphic curve count. A graph with no legs is a closed component,
realized by the vacuum sector of Layer 7.7; its comparison with closed Gromov–Witten theory is
not a target of this roadmap (Scope and ownership).

**Checks.**

- Two inputs joining one output: the term p_γ p_η q_θ of h, automorphism group of order 2 when
  γ=η, giving the factor 1/2.
- One input splitting into two outputs: p_γ q_η q_θ, with the factor 1/2 when η=θ and the sign
  of the swap when η=θ is odd (then the term vanishes).
- Two matching edges: ℏ exponent 1, genus 1, multiplicity factor κ_γ κ_η.

*Needs:* Layers 7.6, 8.2.

### 8.4 Nonexact realization

Extend the graph-indexed construction to the nonexact cobordisms and coherent families of
Layer 9, retaining no-positive-end components, full relative classes, nodes/ghosts,
marked/vacuum sectors when selected, finite isotropy and all orientation/covering factors
(Hind–Siegel p. 27, the nonexact twisted functoriality; EGH (38), p. 56, the Novikov-type
support condition). Construct their compact energy/topology/class-window atlases and relative
chain systems, restriction/window inclusions and end/parameter/neck-sewing comparisons. Prove
the raw signed boundary formula with every no-positive component included, then derive the
potential equation and its zero-input and morphism consequences in Layer 9. Do not store the
desired Maurer–Cartan or master identity as an unexplained geometric field. Prove the support
estimates for each coefficient domain used. General nonexact/multi-input/genus consequences
retain this realization datum and its conditional status; the exact one-positive Layer 5
construction remains the separate unconditional target. A support condition alone is neither
this geometric realization nor a vanishing theorem for the extra components.

- The nonexact datum includes, for each energy/class window, a compact moduli problem with
  no-positive-end components allowed.
- Its boundary identity has the same height-two form, now including splittings where one piece
  has no positive end.
- The potential's p-free part is the series of no-positive-end counts.

**Checks.**

- A nonexact cobordism containing a rigid closed sphere of positive area contributes a
  p-free, q-free term to F; the exact datum has no such term.
- A rigid plane in a nonexact cobordism with one negative end contributes a p-free term in q⁻,
  the Maurer–Cartan element of 9.3.
- Below a fixed energy cutoff only finitely many (class, word) pairs occur, by the support
  condition; without the window the datum is not compact.

*Needs:* Layers 1.4, 8.1, 8.2; MorseNovikov N1.

### Examples

- The three graph examples of 8.3 with their automorphism and ℏ factors.
- The two-term and quadratic splittings of 8.2 as generating-series identities.
- The nonexact plane and closed sphere as p-free terms.

### Dependencies

Layers 1, 3, 4, 5 and 7; MorseNovikov N1.

## Layer 9: Class coefficients and the nonexact receiving maps

### 9.1 Class coefficients and the energy-normalized completion

Construct the coefficient extension with relative classes, area and Chern homomorphisms,
capping/reference changes and recapping maps. Use the MorseNovikov N1 period-controlled
completed group ring as the native finite-sublevel carrier, and construct the signed-word
convolution adapter here. Track full class labels even when the area homomorphism is
noninjective. For a rigid curve with output word w derive the energy identity in the chosen cap
convention (1.3), and prove the change from area to energy-normalized generators.

For an energy-normalized contact completion require finitely many nonzero full (class, energy,
word) coefficients below every real cutoff, with a lower support bound (EGH (38), p. 56, the
Novikov-type inequality). Prove convolution finiteness, separatedness, completeness, polynomial
density and the coefficient comparison. Prove that the generator count supports satisfy this
condition, and prove the nonnegative energy estimate that makes d preserve the descending
energy filtration before extending it continuously. An arbitrary completion in increasing orbit
action does not have this property automatically. The differential changes word length, so an
Adams completion preserving a nonnegative grading is not this construction. A completed element
can have infinitely many integer degrees; use homogeneous closed pieces and ordinary complexes,
not a false internal direct-sum decomposition of the whole completed algebra.

- The completed algebra is the MorseNovikov N1 completion of A(V) with respect to the energy of
  words, with the class labels as the group H.
- d is continuous and preserves the energy filtration because every counted curve has
  nonnegative energy.
- The convolution of two elements with finite support below every cutoff has finite support
  below every cutoff.

**Checks.**

- Two orbits of equal action but different classes stay distinct in the completion; an area-only
  completion would identify their labels.
- A word of energy E and a word of energy E′ convolve to energy E+E′; finitely many pairs lie
  below any cutoff by the N1 support condition.
- The element Σ_k q_γ^k over all iterates has infinitely many degrees and lies in the completion;
  it has no finite homogeneous decomposition, which is why the completed algebra is not
  internally graded.

*Needs:* Layers 0.3, 1.3, 5.2; MorseNovikov N1.

### 9.2 Admissibility

Retain all class labels and the Layer 7.5 normal-ordered weight w=N+|I_p|. Construct the
restricted coefficient modules by compatible finite energy/class windows and finite
genus/output-coefficient truncations, with the finite q-word support and contraction bounds of
Layer 7. Prove separatedness, completeness, continuous multiplication, endpoint actions,
evaluation at p=0 and the inverse-limit comparisons before using an exponential. Choose a
complete separated descending multiplicative filtration F^r, r≥0, on these domains, or the
explicit finite/arity-nilpotent alternative (Latschev §2.4, pp. 10–11, the filtered ground ring
and the completion before the exponential). Require the selected no-positive potential a to lie
in F^1 and the relevant brackets/actions to respect additive filtration. This is a
support/valuation/insertion datum with proved estimates, not a field asserting convergence. If a
positive energy gap is used, prove it uniformly for the selected support and families;
positivity of each individual energy without such a support theorem is insufficient. Joint
genus/insertion filtrations may be used with their comparison maps. Do not force finite total
genus support or injectivity of the area homomorphism, and do not specialize an auxiliary
formal parameter to 1 without a proved continuous finite-sum specialization.

For F=a+F′ with F′=F−F|_(p⁺=0), F′ has positive p⁺-length, so the fixed output p-word bounds
the number of F′ factors. Modulo F^r, powers of a of order at least r vanish. The remaining
normal-order weight splits, finite q-polynomials, nonnegative-genus partitions at a fixed
exponent and period-controlled class supports give finite coefficient sums. Prove these
estimates for products, derivatives, contractions, exponentials, logarithms and compositions
separately, including infinite orbit sets, and pass their identities from the truncations to the
complete domain. This constructs E=exp(F)=exp(a)exp(F′) and exp(±a), not an indiscriminate
two-sided p/q completion. The vacuum sector retains its own admissibility/filtration; no
automatic positive vacuum valuation or canonical admissible background is asserted for every
cobordism.

- An admissible domain is a complete separated filtered module on which the endpoint actions
  are continuous and filtration-nondecreasing.
- exp(a) converges for a in F^1 and satisfies exp(a+b)=exp(a)exp(b) for commuting even a, b
  (Latschev (4), p. 11).
- The coefficient of exp(F) at a fixed (I, N, class, energy) is a finite sum.

**Checks.**

- a of filtration 1: modulo F^r the series exp(a) is the polynomial of degree r−1, finite.
- a a scalar of filtration 0 (the unweighted ℏ⁻¹ vacuum term): exp(a) does not converge in the
  filtration, so this a is not admissible.
- F′ with p⁺-length at least 1: the coefficient of exp(F′) at a p-word of length 3 uses at most
  three F′ factors.

*Needs:* Layers 7.5, 7.6, 7.7, 9.1.

### 9.3 The quantum map and the twisted Fock target

Use the even count potential F_W(q⁻,p⁺,ℏ), its genus normalization and the Layer 7.4 endpoint
conventions (EGH (36), p. 55). Define a_W=F_W|_(p⁺=0), the connected no-positive count series,
and F′_W=F_W−a_W. For the cobordism kernel E_W=exp(F_W) construct the continuous linear operator

```
Z_W(g) = (E_W · g(q⁺))|_(p⁺=0) : C_(Y⁺) → C_(Y⁻).
```

The right action uses q_γ⁺=κ_γ⁺ ℏ ∂R/∂p_γ⁺ with the Koszul signs. From H⁻·E_W−E_W·H⁺=0 (EGH
Theorem 2.3.3, p. 58) prove Q⁻Z_W=Z_W Q⁺ by normal ordering and evaluation, and Z_W(1)=exp(a_W)
(Latschev pp. 11–12, Φ(1)=exp(f⁰)). The identity-cylinder kernel is exp(Σ_γ q_γ⁻ p_γ⁺/(κ_γ ℏ)),
with coefficientwise meaning from the positive-p carrier, and induces the identity operator
(EGH (80), p. 69, whose displayed element Σκ_γ⁻¹p_γ q_γ needs the factor ℏ⁻¹ for e^I to act as the
identity under (78)). Do not omit κ_γ.

Define the receiving Fock operator and the normalized morphism by

```
Q^(−,a)(g) = exp(−a) Q⁻(exp(a) g),
T_W(g) = exp(−a) Z_W(g).
```

Prove (Q^(−,a))²=0, T_W(1)=1 and Q^(−,a)T_W=T_W Q⁺. Its curvature is the zero-input output
c^(−,a)=Q^(−,a)(1)=T_W(c⁺). Thus for a punctured flat positive endpoint c⁺=0 the potential
equation derives the quantum Maurer–Cartan identity Q⁻(exp(a))=0 (Latschev p. 12, the p⁺-degree
zero part of the potential equation); it is not an additional assumed count axiom. The
receiving pointed object is (C_(Y⁻),Q^(−,a)), generally different from (C_(Y⁻),Q⁻). If the
positive endpoint includes a curved vacuum sector, retain c^(−,a)=T_W(c⁺), its higher derived
brackets and curved morphism identities; do not set either curvature to zero.

On the Weyl completion construct H^(−,a)=exp(−a)⋆H⁻⋆exp(a) and K^(−,a)=ℏH^(−,a), prove their
master equations and the differential D^(−,a)=[K^(−,a),−]/ℏ. Conjugation transports the Weyl
differential and the normal-order Fock representation. The kernel still gives a
bimodule/morphism, not a multiplicative map of endpoint Weyl algebras. Prove the genus/ℏ bounds
after conjugation: for a nonnegative-genus F and K, each commutator with a has a contraction ℏ
cancelling a's possible ℏ⁻¹; when the quantum Maurer–Cartan identity kills the p-free part, the
Fock operator has no negative ℏ-power. These are coefficient estimates to prove, not assumptions
identifying the two completions.

For all the derived operations expose the higher-morphism identity. For formal even Z=Σ z_i f_i
with matching auxiliary graded variables, let L_T(Z)=log(T_W(exp Z)) in the z-adic completion,
with L_T(0)=0, and V_Q(Z)=exp(−Z)Q(exp Z)=Σ_k l_k(Z,…,Z)/k!. Prove

```
d L_T|_Z (V_(Q⁺)(Z)) = V_(Q^(−,a))(L_T(Z)).
```

Its Taylor coefficients give the curved/higher morphism maps, with their degrees, unshuffle
signs and unit laws. This follows from the proved operator intertwining and the derivative of
the logarithm; no arbitrary maps or desired morphism equations are hidden inputs. The same
formulas apply to the full admissible vacuum/marked branch, with its nonzero zero-input terms
retained.

- Z_W descends to the Fock space because the right ideal generated by p⁺ evaluates to zero at
  p⁺=0.
- T_W is a chain map from (C_(Y⁺),Q⁺) to (C_(Y⁻),Q^(−,a)) with T_W(1)=1.
- exp(−a)Q⁻(exp a)=T_W(c⁺), so the Maurer–Cartan identity holds exactly when c⁺=0.

**Checks.**

- The identity kernel: g=q⁺ with q⁺=κℏ∂R/∂p⁺ gives κℏ·q⁻/(κℏ)=q⁻, so Z=id; without the ℏ⁻¹ the
  kernel gives Z(g)(q⁻)=g(ℏq⁻).
- Q⁻Z_W=Z_W Q⁺: H⁻(E·g)=((H⁻E)·g)=((E·H⁺)·g)=E·(H⁺g), then evaluate at p⁺=0.
- (Q^(−,a))²=exp(−a)Q⁻Q⁻exp(a)=0; T_W(1)=exp(−a)exp(a)=1.
- With c⁺=0: Q^(−,a)(1)=T_W(Q⁺1)=0, which reads Q⁻(exp a)=0; a construction that assumed this
  as an axiom would have nothing to derive.
- The higher-morphism identity at first order: T(e^Z v)=e^(L_T Z) dL_T|_Z(v) for an odd formal
  ε and Z+εv, then v=V_(Q⁺)(Z) and Q^(−,a)T=TQ⁺.

*Needs:* Layers 7.4, 7.8, 8.4, 9.2.

### 9.4 The rational contact map

Write d=2(n−3), let h be the genus-zero rational Hamiltonian, and let b=(F_W)_0|_(p⁺=0), the
genus-zero part before the ℏ⁻¹ normalization. Then |b|=d and b is even, and a=ℏ⁻¹b+O(ℏ⁰) has
degree 0. Define D_b(u)={u,b}, so h^(−,b)=exp(D_b)h⁻=h⁻(q,p+κ∂_q b) on the proved rational
support domain (Latschev p. 11, h^a=h+{h,a}+½{{h,a},a}+…). Derive its master equation and, for
a flat positive endpoint, h^(−,b)|_(p=0)=0 (Latschev p. 11, h^a|_(p=0)=0 is the Maurer–Cartan
condition). On the regraded symbol space with degree |f|−d, its iterated Poisson brackets have
degree −1. Their unary operation is the one-positive target differential, and its square zero
follows from that Maurer–Cartan identity. Keep the full higher curved identities when the
zero-input term is nonzero.

Prove the normal-order genus/ℏ comparison with the quantum construction. For flat punctured
endpoints the ℏ⁰ term of T_W is a unital algebra map φ_W from the positive contact algebra to the
b-twisted negative one, determined by φ_W(q_γ⁺)=κ_γ⁺ ∂/∂p_γ⁺ (F_W)_0|_(p⁺=0). Show
multiplicativity by the exponential derivative/partition formula: terms joining two source
generators gain an extra ℏ, while singleton partitions give the product. Prove
d^(−,b)φ_W=φ_W d⁺, all orientation-line/recapping/covering comparisons and independence of
temporary bases. It is not generally a map into the original d⁻. Retain the exact polynomial
construction: in its punctured no-positive-free domain b=a=0, this recovers Layer 5. An
ordinary nonexact map is a separately proved subcase when all relevant no-positive
contributions vanish or have a specified compatible comparison to the untwisted background,
stable under the compactifications, choices and parameter faces.

- exp(D_b) is the substitution automorphism p_γ↦p_γ+κ_γ ∂b/∂q_γ, q_γ↦q_γ.
- φ_W is a unital ℚ-algebra map, the ℏ⁰ term of T_W on generators extended multiplicatively.
- d^(−,b) is the unary bracket of h^(−,b) and squares to zero when h^(−,b)|_(p=0)=0.

**Checks.**

- Degrees: h of degree d−1 and l_k with k inputs has degree ((d−1)+Σ|f_i|−kd)−d=Σ(|f_i|−d)−1 in
  the regraded space, so −1 as a map of regraded degree.
- |b|=d: F has degree 0 and F=ℏ⁻¹F_0+…, so b=F_0|_(p⁺=0) has degree 0+|ℏ|=d, and a=ℏ⁻¹b has
  degree 0.
- φ_W(q_1 q_2): T(q_1 q_2)=κ_1κ_2ℏ²(∂_1∂_2F+∂_1F∂_2F); the first term is O(ℏ¹) after the ℏ⁻¹
  normalization of F and the second is φ(q_1)φ(q_2)+O(ℏ).
- The nonexact regression at n=3 (d=0), κ=1, even x_1, x_2, t, odd θ, h⁻=θp_1p_2,
  h⁺=θ(p_1+t)p_2 and f=t x_1⁻+Σq⁻p⁺: the untwisted d⁻ is zero on x_1, x_2 (∂_(p_i)h⁻|_(p=0)=0)
  while d⁺(x_2)=θ(p_1+t)|_(p=0)=tθ; on L_f, p_1⁻=t+p_1⁺, p_2⁻=p_2⁺, q⁺=q⁻, so
  h⁻|_(L_f)=θ(t+p_1⁺)p_2⁺=h⁺|_(L_f); then b=t x_1⁻ gives h^(−,b)=θ(p_1+t)p_2 and
  d^(−,b)(x_2)=tθ, so the twisted target receives the chain map and the untwisted one does not.

*Needs:* Layers 5.2, 7.2, 7.3, 9.3.

### 9.5 Composition and choices

For kernels of W_1:Y_0→Y_1 and W_2:Y_1→Y_2, construct the intermediate contraction E_21=E_2#E_1
and prove Z_21=Z_2 Z_1 (EGH Lemma 2.5.1, p. 68). Its induced vacuum satisfies
exp(a_21)=Z_2(exp(a_1)) (Latschev Lemma 10, pp. 12–13, Φ(e^a)=e^(f_*(a))); in general a_21 is
not a_2+a_1. Under the admissibility/invertible-vacuum hypotheses define
T_2^[a_1]=exp(−a_21) Z_2 m_(exp(a_1)). Prove its source is Q_1^(a_1), its target Q_2^(a_21), it
sends 1 to 1, and T_21=T_2^[a_1] T_1 (Latschev p. 13, Φ_a=Ψ_(−f_*(a))∘Φ∘Ψ_a with Φ_a(1)=1), with
the class and end identifications. Its higher Taylor maps compose by formal substitution. Prove
identity, associativity and disjoint-union/empty-end symmetry at these backgrounds (EGH (79),
p. 69), including the genus and κ contraction factors.

A geometrically glued cobordism's chosen potential is compared to E_21 by its neck-family
chain/parameter data (Pardon §1.5, p. 7, the composition homotopy); do not assert literal
equality of unrelated choices. Construct the background paths, pointed higher comparison maps
and homotopies, with their two-parameter composition coherences. Use a rational polynomial
de Rham interval ℚ[t,dt], or a piecewise/filtered interval model with rational integration and
endpoint maps; prove those maps continuous and the ordered integrals defined on the chosen
support. Geometric parameter chains are compared to that model, not identified with arbitrary
ℚ-valued smooth paths. For a flat rational higher-bracket system an admissible Maurer–Cartan
path b_t with parameter η_t of shifted degree +1 has ḃ_t=l_1^(b_t)(η_t). Construct its
transport from A_t(x)=l_2^(b_t)(η_t,x), U̇_t=A_t U_t, and prove ḋ_t=A_t d_t−d_t A_t, hence
d_t U_t=U_t d_0; positive filtration/nilpotence makes the ordered series and its inverse
defined. In the rational multiderivation case A_t is a derivation and the transport is unital
multiplicative. For the quantum/full branch construct the corresponding higher Taylor/coalgebra
transport and its curved identities, not an assertion that every linear Fock map is
multiplicative. Use only Maurer–Cartan paths/gauges supplied by the coherent family data;
different arbitrary Maurer–Cartan elements are not declared equivalent.

- T_2^[a_1] intertwines Q_1^(a_1) and Q_2^(a_21).
- Composition of twisted morphisms is associative and unital at matching backgrounds.
- A Maurer–Cartan path with its gauge gives an isomorphism of the twisted complexes at its
  endpoints.

**Checks.**

- T_21=exp(−a_21)Z_2Z_1=exp(−a_21)Z_2 m_(e^(a_1))·exp(−a_1)Z_1=T_2^[a_1]T_1.
- T_2^[a_1]Q_1^(a_1)=exp(−a_21)Z_2Q_1 e^(a_1)·(−)=exp(−a_21)Q_2 e^(a_21)T_2^[a_1]=Q_2^(a_21)T_2^[a_1].
- a_21≠a_2+a_1: with a_1=t x_1 and Z_2 the kernel of 9.4's regression, Z_2(exp a_1) differs
  from exp(a_2)exp(a_1) by the contraction terms of E_2 against x_1.
- Gauge transport: d/dt(U_t⁻¹d_tU_t)=U_t⁻¹(ḋ_t−A_td_t+d_tA_t)U_t=0, so d_tU_t=U_td_0.

*Needs:* Layers 7.6, 9.3, 9.4.

### 9.6 The decorated nonexact category

Define the nonexact decorated cobordism category with objects carrying their endpoint
coefficient/virtual choices and a chosen admissible flat Fock background exp(β), with |β|=0,
where one exists. Its rational leading term is β=ℏ⁻¹b+O(ℏ⁰), with |b|=d as in 9.4; exp(b) alone
is not the degree-zero full Fock background when d≠0. A morphism carries the nonexact
realization/support data of 8.4 and its induced outgoing background, or a specified coherent
comparison to the chosen target background. For a given incoming cycle Ψ⁺, its raw outgoing
cycle is Z_W(Ψ⁺); only if it is an admissible invertible vacuum may it be written exp(β⁻) with
|β⁻|=0 and normalized as above. Not every background exists, and not every undecorated strong
cobordism gives an untwisted contact map (Hind–Siegel p. 27). Retain the unpointed/curved
potential-bimodule and full closed/marked sectors when a flat pointing is unavailable. Compare
all finite-window, coefficient, reference/cap, filtration and chosen-background changes by
their continuous maps and compatible family data. Compare with the exact polynomial
construction where finite sums apply. These coefficient comparisons do not extend the
exact-cobordism functor to every strong cobordism without the stated data.

- Objects: (Y, coefficient choices, background exp(β)); morphisms: decorated nonexact cobordisms
  with the induced outgoing background.
- Composition is the twisted composition of 9.5; identities are the identity-cylinder kernels.
- The exact cobordisms with β=0 form a subcategory on which the functor is that of 5.3.

**Checks.**

- d≠0 (n≠3): exp(b) has degree-d exponent and is not a degree-zero background; β=ℏ⁻¹b is.
- A nonexact cobordism whose Z_W(1) is not invertible has no induced flat background; the
  category records the curved bimodule instead.
- The exact subcategory: a=b=0, T_W=Z_W, and the receiving complex is (C_(Y⁻),Q⁻).

*Needs:* Layers 5.3, 8.4, 9.3, 9.5.

### Examples

- The nonexact regression of 9.4 as a two-object decorated category with one morphism.
- The identity cylinder and its κ factors as the identity morphism.
- A composition of two nonexact cobordisms with a_21≠a_2+a_1.

### Dependencies

Layers 5, 7 and 8; MorseNovikov N1.

## Downstream consumers

HamiltonianFloerOperations names this roadmap as the owner of contact/Reeb buildings and of the
contact and full-SFT levels; its count package is a distinct Hamiltonian application and takes
Layers 1–3 and 7 at their stated hypotheses.

## References

- J. Pardon, [Contact homology and virtual fundamental cycles](https://arxiv.org/abs/1508.03873),
  arXiv:1508.03873v4: rational one-positive genus-zero contact algebra, exact cobordism maps,
  coherent virtual systems, compactification and count identities.
- J. Pardon, [An algebraic approach to virtual fundamental cycles on moduli spaces of
  pseudo-holomorphic curves](https://arxiv.org/abs/1309.2370), arXiv:1309.2370v6, Geom. Topol.
  20 (2016): the stratified virtual cochain complex and its quasi-isomorphism, cited in
  Layer 4.2 for the extension from poset to category stratifications; the rest of its engine is
  consumed through ImplicitAtlases. Page numbers are those of arXiv v6.
- Y. Eliashberg, A. Givental and H. Hofer,
  [Introduction to Symplectic Field Theory](https://arxiv.org/abs/math/0010059),
  arXiv:math/0010059v1: the Poisson/Weyl formalism and cobordism potentials.
- F. Bourgeois, Y. Eliashberg, H. Hofer, K. Wysocki and E. Zehnder,
  [Compactness results in Symplectic Field Theory](https://arxiv.org/abs/math/0308183),
  arXiv:math/0308183v3, Geom. Topol. 7 (2003): punctured convergence, buildings and
  compactness.
- J. Latschev, [Remarks on the rational SFT formalism](https://arxiv.org/abs/2212.01814),
  arXiv:2212.01814v1: formal p-series with polynomial q-coefficients, weighted brackets,
  coderivations, morphisms, composition and twisting.
- R. Hind and K. Siegel, [Symplectic field theory: an overview](https://arxiv.org/abs/2410.19936),
  arXiv:2410.19936v1: the analytical, algebraic and conditional realization boundaries.
- S. Ishikawa, [Construction of general symplectic field theory](https://arxiv.org/abs/1807.09455),
  arXiv:1807.09455v3: a distinct Kuranishi approach to the general realization problem.

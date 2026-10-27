# Contact homology and the symplectic field theory formalism

Construct rational contact homology of closed cooriented contact manifolds, its
exact symplectic cobordism maps and symmetric monoidal functor on homology.
Build the punctured-curve analysis, coherent virtual count comparisons and
orientation-line algebra that make this construction work for multiply covered
curves. Develop the multiple-input and arbitrary-genus SFT algebra on explicit
coefficient carriers, together with its geometric realization data and conditional
comparison theorems. These are separate levels of the theory: a contact differential
counts one-positive-end spheres, while the SFT formalism also describes fusion of
several inputs and higher genus.

The definitive specification is this README. `Suggested.lean` states the
headline theorems that are statable against the pinned libraries (the S0
orbit-algebra results) and names those that are not. The basic contact construction
is over ℚ and is unconditionally a construction target. The general SFT realization
assertion in S8 is a precisely stated research-level assertion; the required
deliverables there are its data, statement and conditional algebraic consequences.
Its existence is not a premise hidden in the contact-homology theorem.

## Scope, conventions and suppliers

Work with a closed smooth cooriented contact manifold Y of dimension 2n−1,
n≥2, and a contact form λ with ker λ=ξ. Every covered closed Reeb orbit must
be nondegenerate. An exact cobordism has a compact core, specified positive and
negative contact boundaries, a global primitive, and its cylindrical completion.
Its ends carry fixed cylindrical almost complex structures, with
Ĵ∂s=Rλ and Ĵ|ξ compatible with dλ. Require Ĵ over the entire completed
cobordism to be ω̂-tame: ω̂(v,Ĵv)>0 for every nonzero tangent v, including
on the compact core. For coherent parameter families require Ĵ_t tame
for ω̂_t, with the same compatible cylindrical ends and compactly
supported changes on their cores. Prove preservation under the specified
restriction, common-refinement, neck and gluing constructions. On compact
parameter/core sets prove the quantitative lower bounds used in energy
and gluing estimates; uniform end bounds use the fixed cylindrical data,
not an assertion of a global uniform bound on an arbitrary noncompact
family. Global compatibility may be used as a stronger admissible choice. Disjoint unions and empty ends are
included. Nonexact coefficient-valued constructions have the additional support
and class data in S9; exact-cobordism theorems retain their exactness hypothesis.

| Datum | Convention |
| --- | --- |
| Morphism direction | A cobordism from Y+ to Y− gives a map from the positive contact algebra to the negative one |
| Principal coefficients | ℚ; orbit orientation lines are formed integrally before scalar extension |
| Principal grading | Parity, without an assumed global integer Conley–Zehnder lift |
| Integer comparison | For a specified compatible lift, homological degree of qγ is CZSFT(γ)+n−3 and the differential has degree −1 |
| Native DG comparison | Reindex C^k=CC−k, so the differential has degree +1 |
| Signs | Koszul signs use actual parity; orientation and normal factors retain their displayed order |
| Multiplicities | κγ is the positive covering multiplicity; marker and permutation factors are derived from the labelled/unlabelled comparison |
| Symplectization energy | Hofer's bounded energy, not the generally infinite integral of d(e^sλ) |
| Full SFT normalization | Normal-ordered q then p; [pγ,qη]super=δγη κγℏ, with ℏ even |

Use the following single owners at their stated scope.

- [ContactGeometry, CG1–CG6](../SymplecticGeometry/ContactGeometry/README.md)
  supplies contact forms, Reeb vector fields, symplectizations, contact-type ends
  and the elementary contact transformations. This roadmap constructs the orbit
  and punctured-count applications of that geometry.
- [HeegaardFloer, F0 and F1.1–F1.5](../HeegaardFloer/README.md)
  supplies Banach/Fredholm, cylindrical Sobolev, elliptic/adjoint/UCP,
  common-domain spectral flow, the single Maslov/CZ and determinant-line theory,
  punctured weighted Riemann–Roch and finite-dimensional zero-mode extensions.
  F2's ordinary curve regularity and conditional gluing are inputs only at their
  actual hypotheses. S2–S4 construct the nonlinear Reeb-end and building adapters.
- [ImplicitAtlases, V0–V6](../ImplicitAtlases/README.md)
  supplies topological atlas data, orientation sheaves, relative virtual
  complexes, normalized global obstruction traces, specified refinement and
  concordance comparisons, and finite cell-like strata/products. Its principal
  VFC is a functional on cohomology. S5 constructs the contact-specific
  coherent chain diagrams and comparisons needed before extracting counts.
- [DGAInfinity](../DGAInfinity/README.md) supplies generic graded modules,
  signed tensor operations, DG/A∞ algebra and category vocabulary. Use the
  implemented `TauCeti.InternalGrading`, `TauCeti.IsDGAlgebra` and ordinary
  cochain-complex assembly where their hypotheses hold.
  [StablePeriodicCurved](../StablePeriodicCurved/README.md) supplies parity
  complexes and their integer/parity comparisons. The contact differential has
  square zero; ℏ is a genus parameter, not a curved-module curvature element.
- [MorseTheory](../MorseTheory/README.md) supplies finite-dimensional Morse
  operations used in the explicit comparison examples. SFT does not introduce
  another Morse complex or another linear index construction.
- [GromovWittenTheory](../GromovWittenTheory/README.md)
  supplies closed-curve comparison targets when S8 has no punctures. Its closed
  stable-map compactification does not establish the Reeb-end compactification.

Use native manifolds, vector bundles, flows, `ModuleCat`, tensor algebras,
quotients, direct sums, cochain complexes and homology. Construct missing
application adapters here. No implementation or merger of a supplier proposal
is required before constructing its specified objects.

## S0. Orbit lines and usable signed algebras

Construct parametrized periodic Reeb trajectories, their periods and iterates,
unparametrized orbits, covering multiplicities, asymptotic markers and their
finite reparametrization groups. Prove a positive lower bound for periods and
finiteness of nondegenerate unparametrized orbits below each fixed action bound.
State the compactness/isolation argument including covered orbits. Construct
generic nondegenerate contact forms using the actual parameterized Reeb return
map and its iterates; a generic-J theorem is not this assertion.

From S3's determinant transport construct the integral rank-one orbit line oγ
and its cyclic marker action. Good means this action is trivial; bad means it
is nontrivial. Prove this agrees with the usual even-cover parity criterion,
including its invariance under changing auxiliary trivializations. Construct
V=⊕γ good (ℚ⊗ℤ oγ), with the actual parity of each summand. The orientation
line is retained until a temporary basis is chosen for a coordinate formula.

Construct the free unital supercommutative algebra A(V) as the native tensor
algebra quotient by xy=(−1)^(|x||y|)yx for homogeneous generators. Prove the
universal property, functoriality, homogeneous decomposition, basis independence,
and the comparison with Sym(Veven)⊗Exterior(Vodd) over ℚ. In particular odd
squares vanish. Mathlib's ordinary unsigned `SymmetricAlgebra` is used only
on the even part. Supply inclusions, projection onto each word length, finite
signed monomial expansions, permutation/braid identities, coefficient extension
and the disjoint-orbit tensor-product comparison. These are the specialized
free orbit-algebra adapters; the generic DG interface remains with its owner.

For the disjoint-orbit comparison use Mathlib's signed `GradedTensorProduct`
carrier with the pinned Tau Ceti total-degree grading
`TauCeti.gradedTensorGrading` (its `TauCeti.isInternal_gradedTensorGrading`,
graded-algebra instance, `TauCeti.gradedTensorLift` and the two graded
inclusions), and assemble differentials with
`TauCeti.isDGAlgebra_gradedTensorGrading`, `TauCeti.dgTensorLift` and the
DG inclusions. Construct the tensor input-degree grading on the native tensor
algebra, and descend it to the signed quotient by images of homogeneous tensor
pieces, using `TauCeti.GradedAlgebra.quotientPiece` and
`TauCeti.GradedAlgebra.isInternal_quotientPiece` for a homogeneous ideal
(passing from `RingQuot` to the two-sided ideal quotient where that API needs
it). For an existing integer lift, push its grading along ℤ→ℤ/2 by the same
proposal's fibre-sum construction and compare with the directly constructed
parity-only algebra. This comparison does not produce an integer lift from
parity data. Prove compatibility of generators, multiplication, differentials
and coefficient maps. Construct the missing scoped adapters here in that API
shape; adopt the upstream implementation when available.

Prove that a parity-odd linear assignment V→A(V) extends uniquely to an odd
Leibniz map d, and that d²=0 is equivalent to its vanishing on generators.
Construct the corresponding integer-graded statements when an integer lift is
supplied. In the integer-graded lane A(V) is `SignedSym G`, the `RingQuot` of
the tensor algebra by the Koszul relation `signedSwapRel G` for an internal
grading G of V, with generator map `generator G`. Its degree-p piece
`signedSymPiece G p` is the span of the images of words in homogeneous
generators of total degree p. Prove that these pieces make A(V) a ℤ-graded
algebra (`nonempty_gradedAlgebra_signedSymPiece`), that a degree-one
assignment on generators extends uniquely to a signed Leibniz map
(`exists_unique_odd_extension`), and that a degree-one signed Leibniz map
squares to zero if and only if d∘d vanishes on generators
(`odd_square_zero_iff_generators`). After the generator identity, the result
is a `TauCeti.IsDGAlgebra` for the graded algebra structure on these pieces. The latter theorem reduces the geometric boundary identity to a
checkable algebraic statement; it does not supply that boundary identity.

## S1. Punctured maps, energy and compactification

Define stable punctured maps into completed cobordisms and symplectizations:
ordered positive and negative punctures with orbit and marker data, complex
domains, nodes, relative homotopy/homology labels, and their actual finite
automorphisms. Construct normalization and domain deformations. In the contact
core use connected genus-zero maps with one positive end and any finite number
of negative ends, including planes. Define the target translation quotient
where it acts, and identify the remaining isotropy; an ℝ quotient is not a
finite group quotient.

Construct the bounded dλ/Hofer energy and its cobordism-core extension. Prove
positivity, the end Stokes formula, action bounds, and the exclusion of
nonconstant closed components in the exact case. Prove finite-energy
exponential convergence to the specified nondegenerate orbit with phase,
marker and coordinate comparisons, using S2's end operators. A genuine Reeb
end is not a removable puncture under a finite ordinary-area hypothesis.

Build the topology of holomorphic buildings with actual level and matching
data, domain convergence, neck stretching and componentwise target translations.
Prove sequential/compact Hausdorff bounded energy/topology pieces with the
appropriate finite type and class statements. Establish the compactness theorem
before imposing smooth-J regularity. Keep fixed genus, ends and the necessary
energy/class window in the nonexact statement; no finite global orbit set is
asserted across all action levels.

For the contact theorem construct Pardon's smaller compactification: omit
trivial cylinders and forget relative vertical positions as specified by its
tree model. Prove its relation to the retained-level building compactification,
its actual cell-like stratification and all codimension-one faces used in S5.
Prove the effect of forgotten faces on the count comparison rather than
identifying the two compactifications by terminology. Families of cobordisms
and composition necks have their own compactifications and relative faces.

## S2. Weighted linear and nonlinear Reeb-end analysis

Identify the normal asymptotic operator along a Reeb orbit with F1's actual
selfadjoint graph-domain carrier. Prove its spectral gap, coefficient
regularity and frame-change laws. Split off the ℝ/Reeb tangential directions
and construct the finite-dimensional phase/translation extensions. For every
fixed finite list of ends choose weights smaller than its nonzero spectral
gaps. Construct the weighted Banach charts and nonlinear Cauchy–Riemann
section, with explicit differentiability budgets, its derivative and adjoint,
elliptic bootstrap and compact inclusions on localized regions.

Use map variations and compactly supported domain-complex-structure variations,
quotiented by the actual infinitesimal automorphisms. Construct all slice and
stabilization comparisons; a normal section alone is not the whole tangent
domain. Prove the exponential convergence theorem in S1 from the end equation,
spectral estimates and nonlinear remainder control, first locally and then
with the bounded family uniformity actually used in gluing. The raw energy
compactness construction and this local convergence analysis do not consume
generic surjectivity of multiply covered problems.

Instantiate the punctured Fredholm index and determinant gluing. In the
conventional SFT index the unquotiented virtual dimension is

`(n−3)(2−2g−k+−k−)+2c₁^τ(u*TX)+Σ+ CZ^τSFT−Σ− CZ^τSFT`.

Construct the domain-deformation contribution and prove this formula from
F1.5. Compare actual linearized Reeb paths with F1.4's normalization
CZHF=−μRS: prove the crossing/trivialization dictionary before replacing a
CZSFT symbol by −CZHF. Retain relative c₁, cap and recapping data. Subtract
each genuinely free target-translation factor and add actual family dimensions;
do not subtract one for every arbitrary disconnected building. Prove the
index and orientation comparisons for trivial cylinders, planes and broken
configurations, and the independence of the full index from τ.

## S3. Stabilization, local gluing and orientation descent

Construct incidence stabilization and finite-dimensional compactly supported
obstruction spaces equivariantly under the retained finite groups. Prove
surjectivity of the augmented operator by adjoint elliptic regularity and
unique continuation, retaining the allowed support region. For a specified
surjective augmented problem, build pregluing, calibrated kernel comparisons,
uniform right inverses in the chosen neck/end norms, quadratic estimates,
Newton correction and converse recovery/uniqueness. Include node and Reeb
matching parameters, domain deformations and family directions.

Prove the resulting local homeomorphism with the appropriate cell-like
gluing space, nodal complex parameters, free real parameters and obstruction
directions. Prove compatibility with forgetting auxiliary obstruction spaces
and stabilizations and with group actions. No globally smooth corner structure
is inferred from these topological charts. Generic somewhere-injective
regularity has its stated witnesses; covered curves use the augmented/virtual
construction, not a claim of generic regularity for all covers.

Construct determinant orientation gluing and compare it with the topological
virtual orientation line. Order source/domain, translation/marker, obstruction,
normal and parameter factors explicitly. Construct cyclic marker actions and
prove good-orbit descent and bad-orbit cancellation in the actual boundary
diagram. Derive the labelled/unlabelled count formulas, negative-end permutation
denominators and intermediate covering factors. Prove the formula for repeated
negative orbits, including odd repetitions. A single unexplained 1/|Aut| factor
is not a substitute for these comparisons.

## S4. Actual contact implicit atlases

For every bounded contact tree type construct all of V1's thickenings,
obstruction representations, regular loci, zero-fiber maps, quotient and
extra-factor-freeness data. Prove regular-cover openness, extra-obstruction
projection models and finite subatlas coverage using S3. Include compact
parameter families and the boundary-atlas identifications, with the actual
cell-like face poset and normal orientation lines. Verify every V1/V6 axiom;
the existence of a Fredholm section alone is not an implicit atlas.

Construct compatible restriction, product, stabilization and tree-concatenation
diagrams. Auxiliary choices compare through specified common atlases,
refinements or concordances; different arbitrary atlases on the same zero set
need not have equal virtual weights. Apply V2–V6 to these actual inputs. Prove
regular-locus count normalization and the contact orientation comparison,
including ineffective isotropy and boundary-normal signs.

## S5. Coherent counts, differential and exact functor

Construct the tree-indexed chain-level virtual diagrams for symplectizations,
exact cobordisms, their one-parameter deformations and stretched compositions.
Retain disconnected configurations needed for the family homotopies. Construct
the comparison maps and the inversions of quasi-isomorphisms used to choose
coherent relative representatives. Prove compatibility with tree concatenation,
products, boundary incidence, obstruction generators and auxiliary-choice
comparisons. The V4 cohomology-level trace alone supplies none of these strict
diagram choices. Prove their required homotopies and independence on homology.

Extract the actual rational orientation-line counts from this system. Prove
finite output for each generator in the exact case, the signed boundary
identity with all marker/permutation factors, and its equality with d² on a
generator. Extend by S0, proving d is odd, d1=0, signed Leibniz and d²=0.
Planes contribute length-zero terms and are retained. Prove independence of
temporary orientation bases and the integer/cohomological DG comparison.

Construct unital algebra chain maps for exact cobordisms in the positive-to-
negative direction. Prove chain-map, identity-cylinder and stretched-composition
relations, with the ordinary chain homotopies supplied by these parameterized
systems. Prove independence on homology, rescaling comparisons, contact-form
and compatible-J invariance, and naturality under contactomorphisms. Give the
specified deformation category of exact cobordisms and prove the resulting
symmetric monoidal functor to parity-supercommutative ℚ-algebras. Construct the
empty-object/unit, disjoint union/tensor product, symmetry and composition
coherence maps. Ordinary chain homotopy is the scope of this assertion.

## S6. Augmentations, linearization and computations

For an actual chain algebra augmentation ε:A→ℚ prove I=ker ε and I² are
d-stable and construct the linearized complex I/I². Prove its differential
formula, basis independence, functoriality for augmentation-preserving maps and
the integer/parity comparisons. Construct the stronger algebra-homotopy data
needed for augmented invariance and prove invariance under that specified data.
S5's ordinary chain homotopies are not assumed to possess this strengthening.
Exact-filling augmentation comparisons have their actual additional coherent
family/count data as hypotheses.

For hypertight forms prove the absence of the plane-rooted boundary branches,
construct the cylindrical complex and compare it with the corresponding
length-one contact construction. Give the asymptotically hypertight filtered
version with its cofinal compatibility and limit maps. No augmentation sending
every generator to zero is used without proving its constant-term condition.

Prove the algebra examples da=bc, db=dc=0 with a odd, b,c even, and the
constant-term example da=1. In the latter construct a contracting homotopy,
deduce zero homology and prove there is no unital chain augmentation to ℚ.
Show explicitly why projecting an arbitrary contact differential onto its
length-one part can lose square zero when constant terms are present.

For irrational ellipsoid boundaries, compute the closed Reeb orbits, periods,
covering multiplicities, good-orbit lines and CZ indices in the chosen
trivializations. Prove every contact generator has even parity, hence d=0,
and identify its rational contact algebra and grading with their change-of-
trivialization laws. Derive the sphere/contact-form comparison through S5;
the degenerate round form is not an input to a nondegenerate-orbit count.

## S7. Multiple-input Poisson and arbitrary-genus Weyl algebra

Construct the normal-ordered coefficient algebra with formal p-words and
polynomial q-coefficients, and then formal nonnegative ℏ powers. Coefficients
are on finite signed orbit monomials; odd p or q repetitions vanish. Prove
each multiplication and contraction coefficient is a finite sum. For the Weyl
product, a fixed output p-word bounds the right p-subword; the corresponding
right q-polynomial bounds the possible contractions. Prove this finite-support
argument also for infinitely many orbit labels, signs and the ℏ coefficient.
Do not complete indiscriminately in both p and q.

Construct the graded Poisson bracket with {pγ,qη}=δγη κγ and its Jacobi,
Leibniz and continuity laws. Construct the associative Weyl product with the
displayed supercommutator relation, normal-order basis/universal property and
classical-limit comparison. In the integer lane set
|pγ|=2(n−3)−|qγ| and |ℏ|=2(n−3); prove the bracket has degree −2(n−3).
Give the parity-only versions without imposing integer gradability.

For an odd rational Hamiltonian h with no p-free part and {h,h}=0, construct
the Hamiltonian differential and prove square zero. Construct its iterated-
bracket coderivation on the reduced symmetric coalgebra, the correct shifts,
unshuffle signs, and the comparison of its unary operation with the one-positive
contact differential. These algebraic constructions are conditional on the
displayed Hamiltonian equation and have no unstated analytic hypothesis.

Use the genus-normalized series K=Σg≥0 ℏ^g Hg and H=ℏ⁻¹K. Prove graded
commutators are ℏ-divisible on the specified Weyl carrier. From K⋆K=0 derive
the well-defined operator D=[K,−]/ℏ, its continuity and D²=0; give the equivalent
Laurent-normalized H formulation. Square zero of an inner differential alone
does not imply this master equation. Construct cobordism potential modules,
left/right endpoint actions and contraction-based composition, with a proved
finite-support domain for every exponential and contraction used. Put
`H±=ℏ⁻¹K±`. The even cobordism potential has normalization
`F=ℏ⁻¹Σg≥0 ℏ^g Fg` and integer degree zero when an integer lift is present;
prove these properties from the virtual index. In the mixed p+,q− module,
the left negative-end action has q− acting by multiplication and
`pγ−=κγ−ℏ ∂qγ−` with the left super derivative. The right positive-end action
has p+ acting by right multiplication and q+ by `κγ+ℏ ∂pγ+` with the right
super derivative. For homogeneous m use
`∂R_p m=(−1)^(|p|(|m|−1)) ∂L_p m` and prove the actual opposite-action and
super-bimodule identities. Define
`DX(m)=H−·m−(−1)^|m| m·H+`, and prove DX²=0 from the endpoint master
equations. The potential equation is `DX(exp(F))=0`, equivalently
`H−·exp(F)−exp(F)·H+=0` for even F. Cobordism potentials are not in general
multiplicative maps between endpoint Weyl algebras. Establish the classical
rational limit and the one-positive comparison with its exact multiplicity
normalization.

For these potentials construct the following larger exact-sector carrier.
For a normal-ordered positive p-word I and integer ℏ exponent N, put
`w(I,N)=N+length(I)`. Require a global integer lower bound on w and a
q-polynomial coefficient at each (I,N). Thus ℏ poles may grow with the
positive word length; a single global lower bound on N would exclude exp(F).
Prove the weighted carrier's product and endpoint-module laws: contractions
preserve additive w, the right p-word is a subword of a fixed output p-word,
and the two lower bounds make its possible w-values finite. The corresponding
finitely many right q-polynomials then bound contraction choices. Include the
signs and coefficient topologies in this argument.

In this exact punctured sector write the potentials as H>0 and F>0: every
counted connected domain has at least one positive puncture. There are no
p-free summands, standalone connected closed-map domains or interior marked-form/descendant
insertions in this sector, including no connected stable constant no-end maps.
Retain all ghost components attached to a counted punctured domain. Prove
exactness excludes nonconstant no-positive-end components; exclusion of
standalone constant maps is part of the specified punctured carrier, not a
consequence of the energy identity. Consequently F>0 has positive p-length
and w≥0, with the even parity and genus normalization just specified.

Construct exp(F>0) in the mixed commutative carrier: its coefficient at positive
word I uses only powers at most length(I). The empty configuration gives its
unit term and is distinct from a geometric vacuum count. Construct the endpoint
actions and contraction pairing, proving preservation of their stated domains.
For composition along k≥1 intermediate ends prove the weights add, that the
finite intermediate q-polynomial bounds k and its orbit labels, and that
`gout=g1+g2+k−1` for two connected pieces. A self-loop adds one genus and
one ℏ. These prove the endpoint-pairing finiteness and exponent law independently
of merely asserting closure of the ordinary Weyl product.

Retain p-free/no-positive-end and marked closed-map contributions as a separately
named vacuum/closed-GW sector. Construct its coefficient families with actual
evaluation/compact-support data and its comparison to the closed-GW owner where
that comparison applies. Specify a complete separated multiplicative filtration
in which its even connected vacuum potential has strictly positive filtration,
and prove convergence and the usual identities for its exponential under that
hypothesis. A scalar of zero filtration, or an unweighted ℏ⁻¹ vacuum term,
does not satisfy it. The joint energy/genus/insertion support comparison and
the mixed-sector combination/sewing theorems retain that hypothesis and the
actual virtual compatibility data. The unrefined exact punctured construction
uses F>0; it does not silently set an independently specified vacuum sector to
zero. Nonexact sectors also retain S9's additional class and support data.

**S7.VacuumOperators — Weyl, Fock and curved derived brackets.** On the
proved joint-admissible coefficient domain, let C_Y be the completed
q-symbol module and let m_f denote multiplication by f. Use the existing
normal-order representation qγ↦m_(qγ), pγ↦κγℏ∂_(qγ), and define
`Q_Y(g)=H_Y·g`. Prove Q_Y²=0 from H_Y⋆H_Y=0; distinguish this Fock
operator from the Weyl derivation `D_Y=[K_Y,−]/ℏ=[H_Y,−]`. Put
`c_Y=Q_Y(1)=H_Y|_(p=0)`. The punctured endpoint theory has c_Y=0.
The separately retained vacuum/marked sector need not have c_Y=0 and
must not be declared pointed by terminology.

Construct the symmetric higher derived brackets
`l_k(f_1,…,f_k)=[…[Q_Y,m_(f_1)],…,m_(f_k)](1)`, with l_0=c_Y and the
actual graded commutators. Prove their Koszul symmetry, degree and all
curved identities from Q_Y²=0, including `l_1(c_Y)=0` and
`l_1²(f)+l_2(c_Y,f)=0`. In particular
`l_1(f)=Q_Y(f)−(−1)^|f|f c_Y`; a curved unary operation is not silently
an ordinary differential. Keep C_Y, its distinguished unit and its
homogeneous closed pieces explicit; no internal finite-degree direct-sum
claim is made for the completion. These are SFT/Fock specializations of
the generic signed multilinear/coalgebra and filtered twisting machinery,
not a second generic DG or Maurer–Cartan engine.

## S8. Geometric realization assertion and conditional sewing

Define realization data on the actual graph-indexed punctured moduli problems:
all permitted positive/negative ends and genera; compact energy/topology pieces;
retained finite isotropy, nodes, level and marker data; the augmented gluing
models; virtual orientation lines; relative chain systems and trace comparisons;
and their actual graph-concatenation, family and parameter-face maps. Include
multiple matching edges, cycles and genus addition. A contact tree system is
not definitionally such a graph system.

State the realization assertion that these data can be constructed coherently
for the specified nondegenerate exact contact/cobordism problems. Treat it as a
mathematical statement in its own right, distinct from S5's established-model
construction. The formalization here includes this exact statement and the
conditional theorems below; it does not identify a historical foundational
sketch, an abstract claiming a construction, or unrelated virtual numbers with
a proof of this assertion.

Given those geometric data, prove the raw signed codimension-one boundary and
Stokes identities, coefficient finiteness and orientation/covering comparisons.
Derive {h,h}=0 and K⋆K=0 from those identities, rather than adding the master
equations themselves as unspecified fields in the geometric datum. Derive
the cobordism-potential equation, gluing, parameter homotopies and invariance
under the supplied coherent comparisons, and apply S7. Prove the agreement with
S5 only after constructing the smaller-contact/full-building comparison and
showing that every extra boundary contribution has the asserted effect.

Construct the genus-zero multiple-input and higher-genus examples of the
formalism: two inputs joining one output, one input splitting into two, and
two matching edges producing a handle. Compute their graph automorphisms,
genus/ℏ exponents, multiplicity and orientation contractions. These demonstrate
the loop fusion/separation idea on actual indexed data, without claiming every
formal graph has a nonzero holomorphic curve count. The no-end comparison with
closed GW theory retains its actual evaluation/virtual compatibility inputs.

**S8.NonexactRealization.** Extend the graph-indexed construction to the
nonexact cobordisms and coherent families in S9, retaining no-positive-end
components, full relative classes, nodes/ghosts, marked/vacuum sectors
when selected, finite isotropy and all orientation/covering factors.
Construct their compact energy/topology/class-window atlases and relative
chain systems, actual restriction/window inclusions and end/parameter/
neck-sewing comparisons. Prove the raw signed boundary formula with every
no-positive component included, then derive the potential equation and
its zero-input and morphism consequences in S9. Do not store the desired
Maurer–Cartan or master identity as an unexplained geometric field.
Construct/prove the precise support estimates for each coefficient domain
used. General nonexact/multi-input/genus consequences retain this actual
realization datum and its stated conditional status; the exact one-positive
S5 construction remains its separate unconditional construction target.
A support condition alone is neither this geometric realization nor a
vanishing theorem for the extra components.

## S9. Class coefficients and support comparisons

Construct the coefficient extension with actual relative classes, area and
Chern homomorphisms, capping/reference changes and recapping maps. Use the
[MorseNovikov N1 coefficient theory](../MorseNovikov/README.md#n1-period-controlled-completed-group-rings-and-modules) for its native finite-sublevel group-ring
carrier, and construct the additional signed-word convolution adapter here.
Track full class labels even when the area homomorphism is noninjective.
For a rigid curve with output word w derive the energy identity in the chosen
cap convention, and prove the change from area to energy-normalized generators.

For an energy-normalized contact completion require finitely many nonzero
full (class, energy, word) coefficients below every real cutoff, with a lower
support bound. Prove convolution finiteness, separatedness, completeness,
polynomial density and the coefficient comparison. Prove the actual generator
count supports satisfy this condition, and prove the nonnegative energy
estimate that makes d preserve the descending energy filtration before
extending it continuously. An arbitrary completion in increasing orbit action
does not have this property automatically. The differential changes word
length, so an Adams completion preserving a nonnegative grading is not this
construction. A completed element can also have infinitely many integer degrees;
use homogeneous closed pieces and ordinary complexes where appropriate, not a
false internal direct-sum decomposition of the whole completed algebra.

For nonexact cobordisms retain the required energy/class windows and
compatible systems in S1, S4 and S5, with S8.NonexactRealization's actual
additional coherent data. The completed map has the following explicit
receiving objects and domains; it is not an unqualified untwisted S5 map.
In S7/S8's multiple-input/genus constructions, state and prove the joint
energy/genus/word admissibility needed for each Weyl contraction and
potential; the contact completion alone supplies no such product.

**S9.Admissibility — a concrete convergence domain.** Retain all class
labels and the S7 normal-ordered weight w=N+|I_p|. Construct the actual
restricted coefficient modules by compatible finite energy/class windows
and finite genus/output-coefficient truncations, with the finite q-word
support and contraction bounds of S7. Prove separatedness, completeness,
continuous multiplication/endpoint actions/evaluation at p=0 and the
stated inverse-limit comparisons before using an exponential. Choose a
complete separated descending multiplicative filtration F^r, r≥0, on
these domains (or the explicit finite/arity-nilpotent alternative).
Require the selected no-positive potential a to lie in F^1 and the
relevant brackets/actions to respect additive filtration. This is an
actual support/valuation/insertion datum with proved estimates, not just
a field asserting convergence. If a positive energy gap is used, prove
it uniformly for the selected support and required families; positivity
of each individual energy without such a support theorem is insufficient.
Joint genus/insertion filtrations may be used with their actual comparison
maps. Do not force finite total genus support or injectivity of the area
homomorphism, and do not specialize an auxiliary formal parameter to1
without a proved continuous/finite-sum specialization.

For F=a+F' with F'=F−F|_(p+=0), F' has positive p+-length, so the fixed
output p-word bounds the number of F' factors. Modulo F^r, powers of a
of order≥r vanish. The remaining normal-order weight splits, finite
q-polynomials, nonnegative-genus partitions at a fixed exponent and
period-controlled class supports give finite coefficient sums. Prove
these estimates for products, derivatives, contractions, exponentials,
logarithms and compositions separately, including infinite orbit sets.
Pass their compatible identities from the truncations to the complete
domain. This constructs E=exp(F)=exp(a)exp(F') and exp(±a), not an
indiscriminate two-sided p/q completion. The full vacuum sector retains
its own admissibility/filtration; no automatic positive vacuum valuation
or canonical admissible background is asserted for every cobordism.

**S9.QuantumMap — the no-positive output and twisted target.** Use the
actual even count potential F_W(q−,p+,ℏ), its genus normalization and
S7 endpoint conventions. Define `a_W=F_W|_(p+=0)`, the connected
no-positive count series, and F'_W=F_W−a_W. For the cobordism kernel
E_W=exp(F_W), construct the continuous linear operator

```
Z_W(g) = (E_W · g(q+))|_(p+=0) : C_(Y+) → C_(Y−).
```

The right action uses qγ+=κγ+ℏ∂R_(pγ+) and the actual Koszul signs.
From `H−·E_W−E_W·H+=0` prove `Q− Z_W=Z_W Q+`, by normal ordering
and evaluation, and `Z_W(1)=exp(a_W)`. The identity-cylinder kernel is
`exp(Σγ qγ−pγ+/(κγℏ))`, with coefficientwise meaning from the
positive-p carrier, and induces the identity operator. Do not omit κγ.

Define the receiving Fock operator and normalized morphism by

```
Q^(−,a)(g) = exp(−a) Q−(exp(a)g),
T_W(g) = exp(−a) Z_W(g).
```

Prove `(Q^(−,a))²=0`, `T_W(1)=1` and
`Q^(−,a) T_W=T_W Q+`. Its curvature is the actual zero-input output
`c^(−,a)=Q^(−,a)(1)=T_W(c+)`. Thus for a punctured flat positive
endpoint c+=0 the potential equation DERIVES the quantum Maurer–Cartan
identity `Q−(exp(a))=0`; it is not an additional assumed count axiom.
The receiving pointed object is (C_(Y−),Q^(−,a)), generally different
from (C_(Y−),Q−). If the positive endpoint includes a curved vacuum
sector, retain `c^(−,a)=T_W(c+)`, its higher derived brackets and
curved morphism identities; do not set either curvature to zero.

On the actual Weyl completion construct
`H^(−,a)=exp(−a)⋆H−⋆exp(a)` and `K^(−,a)=ℏH^(−,a)`, prove their
master equations and the differential `D^(−,a)=[K^(−,a),−]/ℏ`.
Conjugation transports the Weyl differential and normal-order Fock
representation. The kernel still gives a bimodule/morphism, not a
multiplicative map of endpoint Weyl algebras. Prove the genus/ℏ
bounds after conjugation: for an actual nonnegative-genus F and K,
each commutator with a has a contraction ℏ cancelling a's possible
ℏ^−1. When the quantum MC identity kills the p-free part, the Fock
operator has no negative ℏ-power. These are coefficient estimates to
prove, not assumptions identifying the two completions.

For all the derived operations expose an explicit higher-morphism
identity. For formal even Z=Σz_i f_i with matching auxiliary graded
variables, let `L_T(Z)=log(T_W(exp Z))` in the z-adic completion, with
L_T(0)=0, and `V_Q(Z)=exp(−Z)Q(exp Z)=Σ_k l_k(Z,…,Z)/k!`.
Prove

```
d L_T|_Z (V_(Q+)(Z)) = V_(Q^(−,a))(L_T(Z)).
```

Its Taylor coefficients give the actual curved/higher morphism maps,
with their degrees, unshuffle signs and unit laws. This follows from
the proved operator intertwining and the derivative of the logarithm;
no arbitrary maps or desired morphism equations are hidden inputs.
The same formulas apply to the full admissible vacuum/marked branch,
with its nonzero zero-input terms retained.

**S9.RationalContactMap — the classical and one-positive comparisons.**
Write d=2(n−3), let h be the genus-zero rational Hamiltonian, and let
b=(F_W)_0|_(p+=0), the genus-zero part BEFORE the ℏ^−1 normalization.
Then |b|=d and b is even; a=ℏ^−1b+O(ℏ^0) has degree0. Define
D_b(u)={u,b}, so `h^(−,b)=exp(D_b)h−=h−(q,p+κ∂_q b)` on the
proved rational support domain. Derive its master equation and, for
a flat positive endpoint, `h^(−,b)|_(p=0)=0`. On the regraded symbol
space with degree |f|−d, its iterated Poisson brackets have degree−1.
Their unary operation is the one-positive target differential, and
its square zero follows from that MC identity. Keep the full higher
curved identities when the zero-input term is nonzero.

Prove normal-order genus/ℏ comparison with the quantum construction.
For flat punctured endpoints the ℏ^0 term of T_W is a unital algebra
map φ_W from the positive contact algebra to the b-twisted negative
one, determined by `φ_W(qγ+)=κγ+∂_(pγ+) (F_W)_0|_(p+=0)`.
Show multiplicativity by the exponential derivative/partition formula:
terms joining two source generators gain an extra ℏ, while singleton
partitions give the product. Prove `d^(−,b)φ_W=φ_W d+`, all orientation-
line/recapping/covering comparisons and independence of temporary bases.
It is not generally a map into the original d−. Retain the exact
polynomial construction: in its punctured no-positive-free domain
b=a=0, this recovers S5. An ordinary nonexact map is a separately
proved subcase when all relevant no-positive contributions vanish or
have a specified compatible comparison to the untwisted background,
stable under the actual compactifications, choices and parameter faces.

**S9.CompositionAndChoices — decorated nonexact categories.** For kernels
of W_1:Y_0→Y_1 and W_2:Y_1→Y_2, construct the actual intermediate
contraction E_21=E_2#E_1 and prove `Z_21=Z_2 Z_1`. Its induced vacuum
satisfies `exp(a_21)=Z_2(exp(a_1))`; in general a_21 is not a_2+a_1.
Under the admissibility/invertible-vacuum hypotheses above define
`T_2^[a_1]=exp(−a_21) Z_2 m_(exp(a_1))`. Prove its source is
Q_1^(a_1), its target Q_2^(a_21), it sends1 to1, and
`T_21=T_2^[a_1] T_1`, with the actual class and end identifications.
Its higher Taylor maps compose by formal substitution. Prove identity,
associativity and disjoint-union/empty-end symmetry at these precise
backgrounds, including the genus and κ contraction factors.

A geometrically glued cobordism's chosen potential is compared to E_21
by its specified neck-family chain/parameter data; do not assert literal
equality of unrelated choices. Construct the actual background paths,
pointed higher comparison maps and homotopies, with their two-parameter
composition coherences. Use a rational polynomial deRham interval
ℚ[t,dt], or a piecewise/filtered interval model with actual rational
integration and endpoint maps; prove those maps continuous and the
ordered integrals defined on the chosen support. Geometric parameter
chains must be compared to that model, not identified with arbitrary
ℚ-valued smooth paths. For a flat rational higher-bracket system an
admissible MC path b_t with parameter η_t of shifted degree+1 has
`dot b_t=l_1^(b_t)(η_t)`. Construct its transport from
`A_t(x)=l_2^(b_t)(η_t,x)`, `dot U_t=A_t U_t`, and prove
`dot d_t=A_t d_t−d_t A_t`, hence `d_t U_t=U_t d_0`; actual positive
filtration/nilpotence makes the ordered series and its inverse defined.
In the rational multiderivation case A_t is a derivation and the
transport is unital multiplicative. For the quantum/full branch
construct the corresponding higher Taylor/coalgebra transport and its
curved identities, not a false assertion that every linear Fock map is
multiplicative. Use only MC paths/gauges actually supplied by the coherent
family data; different arbitrary MC elements are not declared equivalent.

Define the nonexact decorated cobordism category with objects carrying
their actual endpoint coefficient/virtual choices and chosen admissible
flat Fock background exp(β), with |β|=0, where one exists. Its rational
leading term is β=ℏ^−1 b+O(ℏ^0), with |b|=d as above; exp(b) alone
is not the degree-zero full Fock background when d≠0. A morphism carries
the actual nonexact realization/support data and its induced outgoing background,
or a specified coherent comparison to the chosen target background.
For a given incoming cycle Ψ+, its raw outgoing cycle is Z_W(Ψ+);
only if it is an admissible invertible vacuum may it be written exp(β−)
with |β−|=0 and normalized as above. Do not assert that every background exists or
that every undecorated strong cobordism gives an untwisted contact map.
Retain the unpointed/curved potential-bimodule and full closed/marked
sectors when a flat pointing is unavailable. Compare all finite-window,
coefficient, reference/cap, filtration and chosen-background changes by
their actual continuous maps and compatible family data. Compare with
the exact polynomial construction where finite sums apply. These
coefficient comparisons do not extend the exact-cobordism functor to
every strong cobordism without the stated data.

## Construction order and verification

Construct the orbit algebra and raw energy topology first, using the local end
analysis in parallel with raw compactness. Prove augmented local gluing and
orientation transport, then actual contact atlases, then coherent relative
diagrams, rational counts and the contact functor. Algebraic linearization uses
that functor with its own stronger homotopy inputs. The Poisson/Weyl algebra is
independent algebra; its geometric comparison uses the separately stated S8
realization data. S8.NonexactRealization constructs the additional
no-positive/family systems before S9 derives its MC output and twisted
map. S9's actual admissibility estimates precede every exponential,
conjugation, contraction, comparison and decorated composition; the
zero-input and curvature terms are retained until their proved MC or
vanishing comparison applies. Completed coefficient theorems consume
their support proofs.
There is no covered-curve genericity → full gluing → genericity cycle, and no
reverse dependency from a generic virtual engine to this application.

Verify all finite-group/marker/permutation factors on a simple orbit, its good
and bad covers, repeated ends and an ineffective stabilizer. Verify the CZ sign
dictionary on a small rotation, the zero modes of a trivial cylinder, the plane
constant term and both ends of a one-parameter cobordism. Verify the signed
algebra examples: for V=ℚx with |x|=1 the degree-2 piece of A(V) is zero
(x²=−x², so 2x²=0), while for |x|=0 it contains x²≠0, and the unsigned
symmetric algebra gets the odd case wrong; for |x|=0, |y|=1, |z|=2 the
assignment x↦y, y↦z, z↦0 gives d²x=z≠0, whereas x↦y, y↦0 gives d²=0.
Verify the ellipsoid computation, disjoint union symmetry and empty
object. In S7 verify one contraction, two-edge genus addition, ℏ divisibility,
the master-to-square-zero implication and a failure of an indiscriminate
two-sided completion. Every virtual count comparison retains its actual chain
map or proven homology effect.
Verify the nonexact regression at n=3, κ=1 with even x_1,x_2,t, odd θ,
h−=θp_1p_2, h+=θ(p_1+t)p_2 and f=t x_1−+Σq−p+: the untwisted
d− is zero while d+(x_2)=tθ, and b=t x_1− gives the correct twisted
target. Verify quantum zero-input evaluation, source curvature transport,
the identity kernel's κ factors, induced-vacuum composition rather than
naive addition, and a genuine zero-twist exact specialization. Keep
positive-p, positive-filtration vacuum and nonadmissible zero-filtration
examples distinct. Verify global tameness on compact cores/families and
its use, together with exactness, in the closed-component exclusion.

## References

- J. Pardon, [Contact homology and virtual fundamental cycles](https://arxiv.org/abs/1508.03873),
  §§1–5: rational one-positive genus-zero contact algebra, exact cobordism maps,
  coherent virtual systems, compactification and count identities. Its §1.8
  distinguishes stronger homotopies and other SFT levels.
- Y. Eliashberg, A. Givental and H. Hofer,
  [Introduction to Symplectic Field Theory](https://arxiv.org/abs/math/0010059),
  §§2.1–2.5: Poisson/Weyl formalism and cobordism potentials. The geometric
  realization assertion and its algebraic consequences are distinguished above.
- F. Bourgeois, Y. Eliashberg, H. Hofer, K. Wysocki and E. Zehnder,
  [Compactness results in Symplectic Field Theory](https://arxiv.org/abs/math/0308183):
  punctured convergence, buildings and compactness.
- J. Latschev, [Remarks on the rational SFT formalism](https://arxiv.org/abs/2212.01814),
  §2: formal p-series with polynomial q-coefficients, weighted brackets,
  coderivations, morphisms, composition and linearization.
- R. Hind and K. Siegel, [Symplectic field theory: an overview](https://arxiv.org/abs/2410.19936),
  §§3–5: the analytical, algebraic and conditional realization boundaries.
- S. Ishikawa, [Construction of general symplectic field theory](https://arxiv.org/abs/1807.09455):
  a distinct Kuranishi approach to the general realization problem; it is not
  substituted for the contact-specific atlas and compatibility proofs here.

# Neuromanifolds, parametrisations, and neurovarieties

Develop the basic language for studying the functions realised by a fixed neural
architecture, supplied directly through its realisation map. The starting point
is a parametric model: parameters and an input determine an output. Its neuromanifold is the set of realised functions, and its
parametrisation records which parameters realise each function. This separates
properties of the function family from redundancy in its parameters.

The definitions follow [Marchetti–Shahverdi–Mereta–Trager–Kohn][invitation],
Definition 3.1 and §4.3. The library should let another development supply an
realisation map without encoding its architecture in a prescribed data structure.
Dense and convolutional layers provide concrete constructors. Polynomial
models additionally admit finite coefficient coordinates and algebraic closure.
No smooth manifold structure is implicit in the word *neuromanifold*.

[Suggested.lean](Suggested.lean) contains representative interfaces. This README
is the definitive specification. Suggested implementation homes are
`TauCeti/Geometry/Neuromanifold/` and `TauCeti/Geometry/RealAlgebraic/` for the
model-specific interfaces and reusable affine algebraic lemmas respectively.

## Conventions and boundaries

The user supplies a parameter space $\Theta$, input and output spaces $X,Y$,
and a realisation map $F:\Theta\to(X\to Y)$. This is the interface for fixing
an architecture: the map already encodes connectivity, weight sharing, skip
connections, biases, and activations. No universal architecture record, layer
sequence, or tuple of widths is required. Distinct architectural descriptions
may supply the same map; the general definitions depend only on the supplied map
and its domain.

In the polynomial setting, a user can directly supply a polynomial coefficient
map $c:K^p\to V$, with a specified finite polynomial function space $V$ and its
faithful evaluation map $E:V\to(X\to Y)$. Then $F:=E\circ c$. Equivalently,
a joint polynomial tuple in parameters and inputs supplies $F$ and the
coefficient construction in Milestone 3 supplies $c$. Both are entry points;
using an MLP or CNN constructor is not a prerequisite. A polynomial map into
coefficient space means that each coordinate is polynomial in the parameters.

Equality of realised functions means equality at **every** input, not equality
on a training set or almost everywhere. Restricted parameter sets are represented
by subtypes. No topology, regularity, or injectivity is required for the general
realisation-map interface. Polynomiality is an additional hypothesis for the
polynomial constructions.

MLPs and CNNs are concrete constructors of realisation maps, not the definition
of architecture. Within the MLP constructor, follow Finkel's convention: only
hidden layers have activations, and the output layer is affine (linear without
biases). These conventions impose no restriction on a separately supplied map.

Dense/convolutional evaluation and polynomial substitution are over a field $K$.
The faithful polynomial-to-function comparison requires $K$ infinite, covering
both $\mathbb R$ and $\mathbb C$. Real-only constructions include ReLU, tanh,
and semialgebraicity. Bias-free networks have a separate weight-only parameter
space, embedded into affine parameters by zero biases: their fibres must not
contain artificial bias coordinates. Identity activations give linear networks;
monomial activations are $t\mapsto t^{r_i}$, with layer-dependent exponents.

Use **neurovariety** for the Zariski closure of the coefficient image, following
[Finkel–Rodriguez–Wu–Yahl][threshold], §1.1, equations (3)–(4). Keep the realised
image (neuromanifold), its neurovariety, and the property that these coincide
separate. The invitation paper does not separately define neurovariety;
[Shahverdi][cnn], §2.2, uses the term for a closed neuromanifold. Record that
terminological difference without imposing closedness on every realised image.
The closure is taken in $K$-points using equations over $K$. Real and complex
parameter maps are distinct instantiations of the same definitions.

The targets are foundations and elementary examples. Generic identifiability,
activation-degree thresholds, dimension, degree, singularities, optimisation,
learning bounds, tropical geometry, and approximation are outside this contribution.
In particular, [threshold][threshold], Theorem 18 and its generic-fibre argument,
are motivation, not implementation targets here. They require additional
polynomial independence and genericity results beyond this starter library.
Schemes and real/complex dimension comparison are also outside scope.

## Existing material and dependencies

Use Mathlib's `Set.range`, `Set.image`, `Setoid.ker`, `Quotient`, `Matrix`,
`LinearMap`, and `MvPolynomial`. Do not create a parallel theory of images,
quotients, or polynomial evaluation.

* [Polynomial evaluation and extensionality][funext] provide `MvPolynomial.eval`
  and `MvPolynomial.funext`. Over an infinite field, polynomial equality is detected by
  evaluation at every point. This is the bridge from coefficients to functions.
* [Bounded-degree polynomial submodules][degree] provide
  `MvPolynomial.restrictTotalDegree`, its membership characterization, and its
  `Module.Finite` instance for finitely many variables. Construct the
  vector-valued coefficient presentation from this material.
* [Affine zero loci][zeros] provide `MvPolynomial.zeroLocus`,
  `MvPolynomial.vanishingIdeal`, and
  `MvPolynomial.zeroLocus_vanishingIdeal_galoisConnection`. These work over any field
  without an algebraic-closedness assumption. Do not apply the complex
  Nullstellensatz's radical-ideal conclusion over `ℝ`.
* Tau Ceti's [semialgebraic function API][semifunction] provides
  `TauCeti.IsSemialgebraicMap`; its [image API][semiimage] provides
  `TauCeti.IsSemialgebraic.image_eval` **assuming projection closure**.
  The unconditional real projection theorem is supplied by
  [RealAlgebraicGeometry, Layer 6][rag], with its earlier-layer prerequisites.
  Milestone 4 consumes that theorem; it does not redevelop CAD or quantifier
  elimination. The existing conditional image theorem alone does not discharge
  the unconditional semialgebraicity target.

This roadmap owns the model API, architecture constructors, coefficient/function
comparison, and their algebraic image consequences. The real algebraic geometry
overlap is confined to the explicit supplier above; differential manifold theory
is not a prerequisite.

## 1. Realised functions and parameter fibres

For a model $f$, define

$$\mathcal M_f := \{g : X \to Y \mid \exists w : W,\ f(w)=g\}.$$

Keep both the ambient realisation map $w\mapsto f(w)$ and its corestriction
$\varphi_f : W\to\mathcal M_f$. Define the fibre over an ambient function $g$
as $\{w\mid f(w)=g\}$, and parameter equivalence by $w\sim v$ exactly when
$f(w)=f(v)$. Sources: [invitation][invitation], Definition 3.1 and §4.3.

Prove the following API using the existing set and quotient library:

1. Membership is equivalent to having a parameter witness; the corestriction
   is surjective and its coercion is the ambient realisation map. Fibres are
   nonempty exactly on the neuromanifold. Fibres of distinct functions are
   disjoint, and the fibre over $f(w)$ is the equivalence class of $w$.
2. Construct the equivalence $W/{\sim}\simeq\mathcal M_f$, with the commuting
   equation on representatives. This is a set equivalence, with no claim about
   quotient or subspace topologies. A map out of $W$ factors uniquely through
   $\varphi_f$ exactly when it is constant on each fibre.
3. For $r:W'\to W$, the image of $f\circ r$ is contained in $\mathcal M_f$;
   equality holds if $r$ is surjective. Give the fibre preimage formula and
   transport along parameter equivalences. State restriction as the image of
   the restricted parameter set, including empty sets.
4. For $h:Y\to Z$, postcomposition sends $\mathcal M_f$ to the neuromanifold
   of $w\mapsto h\circ f(w)$. If $h$ is injective, it preserves and reflects
   parameter equivalence. For any input map $a:X'\to X$, give the analogous
   image formula for precomposition; it reflects equivalence when $a$ is
   surjective. Include empty parameter and singleton parameter cases.

These are elementary consequences of the source definition and proposed
library interfaces, rather than additional theorems attributed to the paper.

## 2. Constructors of realisation maps

### MLP specifications and parameter spaces

As one way to supply a realisation map, construct an MLP specification with
depth $L$, widths indexed by
$\{0,\ldots,L\}$, and scalar hidden activations indexed by $\{1,\ldots,L-1\}$.
For a fixed MLP specification construct

$$\Theta_A:=\prod_{i=1}^L
  (K^{d_i\times d_{i-1}}\times K^{d_i}),\qquad
  W_A:=\prod_{i=1}^L K^{d_i\times d_{i-1}}.$$

The first is the affine parameter space; the second is bias-free. Define
$h_0(x):=x$ and $h_i(x):=\sigma_i(W_i h_{i-1}(x)+b_i)$ coordinatewise,
where $\sigma_L:=\mathrm{id}$ and realisation is $F_A(\theta):=h_L$.
Thus $h_L=W_Lh_{L-1}+b_L$ when $L\ge1$. Supply the zero-bias embedding
$W_A\hookrightarrow\Theta_A$ and define the bias-free realisation by restriction.
Attach Milestone 1's neuromanifold, parametrisation, and fibres to each version.

Prove the prefix recursion, zero-depth and one-layer equations, extensionality
in weights and activations, concatenation of architectures with matching boundary
widths, and agreement with iterated composition below. Identify parameter products
under concatenation explicitly. Give constructors for identity activations,
arbitrary layerwise polynomial hidden activations, and monomial exponents $(r_i)$.
Changing depth, widths, or activations produces a different model; it does not
enlarge the parameter space of a fixed model.

For the monomial specialization used in [threshold][threshold], Definition 1,
require $L\ge1$, no biases, and common hidden exponent $r$; the output head
is linear by convention.
Its realisation is exactly $W_L\circ\sigma_r\circ\cdots\circ\sigma_r\circ W_1$.
Keep a constructor with unequal hidden exponents as well. This ensures the paper's
objects instantiate the library directly, without redefining an MLP.

### Composition and concrete layers

Build models by composing two supplied models $f:W\to X\to Y$ and
$g:V\to Y\to Z$, with parameter space $W\times V$ and realisation
$(w,v)\mapsto g(v)\circ f(w)$. Prove the image formula, evaluation equation,
and associativity under the canonical reassociation of parameter products.
A parameter-free identity model supplies the unit equations. Iteration gives
finite chains with varying intermediate types; include the empty chain.
This supplies the compositional reading of [invitation][invitation], §3,
equation (2), without requiring a universal syntax for neural architectures.

Over $K$, provide these concrete constructors and their specialisation laws:

* A dense affine layer has parameters $(A,b)$ and value $Ax+b$, with `Matrix`
  indices drawn from finite input and output types. Prove its coordinate
  evaluation formula and that $b=0$ gives the linear layer.
* A coordinatewise activation layer has value $x\mapsto(i\mapsto\sigma(x_i))$.
  Prove evaluation, identity-activation, and compatibility with coordinate
  permutations. Over the appropriate scalar field instantiate identity, $t\mapsto t^r$ for every natural $r$
  (including zero), ReLU $t\mapsto\max(0,t)$, and $t\mapsto\tanh(t)$.
* A one-dimensional, single-channel valid convolution has filter length
  $k>0$, stride $s>0$, input length $n$, and output length $m>0$, satisfying
  $n=s(m-1)+k$. With zero-based indices define
  $C_w(x)_i:=\sum_{j=0}^{k-1}w_jx_{si+j}$. No padding or filter reversal is
  used. Prove index validity, construct its structured matrix, and prove the
  matrix and sum presentations agree. Add a scalar bias shared across output
  positions as a separate affine constructor. Reference: [cnn][cnn], §2.1,
  equations (2.1)–(2.2).

Build finite dense chains and finite convolutional chains, with fixed hidden
activations, using these constructors. For two bias-free dense layers with
identity activation, prove that realisation is $x\mapsto BAx$ and that its
neuromanifold is the image of $(A,B)\mapsto BA$ under matrix evaluation.
For convolutional chains, prove the recursive layer evaluation formula. Both
are applications of Milestone 1 with the complete parameter products; do not
assume that different parameter tuples yield different functions.

## 3. Polynomial models and faithful coefficient coordinates

An algebraic model in [invitation][invitation], §3.1, is polynomial jointly in
parameters and inputs. Develop its algebraic interface over an infinite field $K$.
Represent it by a tuple
$P_j\in K[w_1,\ldots,w_p,x_1,\ldots,x_n]$, one polynomial for each
output coordinate, with evaluation defining the underlying model. In Lean use
`MvPolynomial (Fin p ⊕ Fin n) K` and evaluate at `Sum.elim w x`.
A supplied polynomial coefficient map is also accepted directly: compose it with
the faithful evaluation map to obtain a model, and prove that extracting
coefficients recovers the supplied map in those same coordinates. This
round-trip law connects the two entry points without architecture metadata.

1. Enumerate the finitely many weights and biases of each fixed chain to
   identify its parameter product with `Fin p → K`; prove the reconstruction
   and evaluation equations. Construct constants, coordinate projections, affine layers, pairing,
   parameter reindexing by polynomial maps, and composition by polynomial
   substitution. Prove their evaluation equations. Deduce joint polynomiality
   for the dense and convolutional chains of Milestone 2 whenever all
   activations are polynomials. Identify the identity-activation specialisation.
2. Collect coefficients in the input variables. Produce a uniform input-degree
   bound $d$, independent of $w$, and polynomial coefficient functions
   $c_{j,\alpha}(w)$ such that
   $f(w)(x)_j=\sum_{|\alpha|\le d}c_{j,\alpha}(w)x^\alpha$.
   Prove this identity from polynomial substitution and coefficient extraction.
   Include zero outputs and constant polynomials. The bound need not be minimal.
3. Let $V$ be the product, over output coordinates, of
   `MvPolynomial.restrictTotalDegree (Fin n) K d`. Construct its monomial
   coefficient linear equivalence with a finite coordinate space $K^J$,
   where $J:=\{(j,\alpha):|\alpha|\le d\}$. Prove that this index type is finite,
   evaluation $E:V\to(X\to Y)$ is linear and injective, and the polynomial
   coefficient map $c:W\to V$ satisfies $E\circ c=f$.
4. Prove $E(\mathrm{range}(c))=\mathcal M_f$, and that coefficients and functions
   give equivalent fibres and equivalent realised-image types. For any faithful
   finite linear presentation with this commuting equation, supply the same
   comparison API. Faithfulness means injectivity of the evaluation map; a
   presentation by sampled outputs does not satisfy it automatically.
5. Prove compatibility with increasing the degree bound by zero-padding the
   coefficients, and with changing the basis of the same ambient vector space
   by a linear equivalence. These statements are the precise independence
   guarantees; an arbitrary nonlinear encoding is not a coordinate change.
6. For a bias-free monomial MLP with positive hidden exponents $r_i$ (with the
   bookkeeping output exponent fixed to one), prove every coordinate polynomial is homogeneous of degree
   $\prod_i r_i$. Zero polynomials are homogeneous of this degree; do not assert
   they have that total degree. For a linear head and common hidden exponent
   $r>0$, obtain degree $r^{L-1}$ when $L\ge1$. Construct the homogeneous
   coefficient presentation and its inclusion into the bounded-degree one.
7. Transport polynomial architectures and their realisations along field
   embeddings by mapping coefficients, weights, and inputs. In particular prove
   evaluation compatibility for $\mathbb R\hookrightarrow\mathbb C$. Do not
   equate the real and complex images or fibres, or assert a dimension comparison.

### Elementary symmetries of monomial MLPs

For a bias-free monomial MLP, prove the hidden-neuron transformations preserve
realisation. At a hidden layer $i$, a permutation matrix $P$ gives
$W_i\mapsto PW_i$ and $W_{i+1}\mapsto W_{i+1}P^{-1}$.
For an invertible diagonal matrix $D$ and activation exponent $r_i$, the scaling
is $W_i\mapsto DW_i$ and $W_{i+1}\mapsto W_{i+1}D^{-r_i}$; the power is entrywise
on the diagonal. Other weights are unchanged. Prove inverse and composition
laws and that these transformations generate an equivalence relation on $W_A$.
Its classes lie in realisation fibres. No converse is asserted. Source:
[threshold][threshold], Lemma 4 and equation (6), with the same local calculation
for layer-dependent exponents.

Define identifiability at a parameter tuple modulo these symmetries by requiring
its entire realisation fibre to equal its symmetry class. Prove equivalence with
injectivity at that class of the induced map from the symmetry quotient to the
neuromanifold. This is a definition and comparison API; no generic-identifiability
assertion or degree bound is included.

Dependencies: Milestones 1–2 and Mathlib polynomial evaluation, substitution,
bounded-degree submodules, homogeneous polynomial submodules, finite sums,
and polynomial extensionality. Use Mathlib’s `MvPolynomial.IsHomogeneous`
for the homogeneous specialization; prove the required substitution and
coefficient-support comparisons here if absent. The
coefficient extraction and comparison bridges are new targets here.

## 4. Neurovarieties and algebraic images

Work in a specified finite coordinate space over the infinite field $K$, with coefficient image
$S:=\mathrm{range}(c)$. Define

$$I(S):=\{q\mid \forall z\in S,\ q(z)=0\},\qquad
  Z(I):=\{z\mid \forall q\in I,\ q(z)=0\},\qquad
  \mathrm{algClosure}(S):=Z(I(S)).$$

Use Mathlib's vanishing ideal and zero locus for these definitions. Define the
**neurovariety** of the coefficient parametrisation to be
$\mathcal V_c:=\mathrm{algClosure}(\mathrm{range}(c))$.
Separately, say its realised image is algebraic when $\mathcal V_c=S$,
equivalently $S=Z(J)$ for some ideal $J$. This follows the convention of
[threshold][threshold], §1.1. The name `IsAlgebraicImage` should express the
closed-image property; it is not a prerequisite for defining a neurovariety.

1. Supply membership lemmas and derive extensivity, monotonicity, idempotence,
   and the smallest-zero-locus property from the existing Galois connection.
   Prove $I(\mathrm{algClosure}(S))=I(S)$ and the zero-locus characterization
   of the algebraic-image predicate. Include empty and full ambient images.
2. The corestriction of $c$ to $S$ is surjective; its map to the algebraic
   closure has image exactly $S$. Prove equality with the whole closure exactly
   when the image is algebraic. No general surjectivity onto the
   closure is asserted.
3. Prove closure and closedness commute with invertible $K$-linear coordinate
   changes. For degree-bound enlargement, prove that zero-padding maps closure
   to closure in the enlarged space and preserves and reflects closedness;
   the extra coordinates vanish on that image. Together with Milestone 3,
   these make the closure and closed-image property independent of the chosen basis and degree bound.
4. Prove the coefficient image of every real jointly polynomial model is
   `TauCeti.IsSemialgebraic`, using the polynomial coefficient map and
   RealAlgebraicGeometry Layer 6's real projection theorem through the existing
   `IsSemialgebraic.image_eval` API. No finite-dimensional semialgebraic
   structure is asserted for the entire function space of an arbitrary ReLU
   or transcendental model.
5. Over $\mathbb R$, give two explicit checks, including their faithful function presentations.
   For $f_w(x):=wx$, the scalar coefficient image is $\mathbb R$, so image and
   neurovariety coincide. For $g_w(x):=w^2x$, the coefficient image is $[0,\infty)$,
   while its algebraic closure is $\mathbb R$, so its image is not algebraic.
   Prove the latter closure by showing that a univariate polynomial vanishing
   on all nonnegative reals is zero. These elementary examples are proposed
   acceptance targets, not examples attributed to the source paper. They show
   why polynomiality does not imply Zariski-closed image.

Dependencies: Milestones 1 and 3, the existing affine ideal/zero-locus API,
univariate polynomial root finiteness, real square roots, and the explicitly
named semialgebraic supplier for item 4. General closure lemmas must remain
usable independently of models and of that supplier.

## References

* Giovanni Luca Marchetti, Vahid Shahverdi, Stefano Mereta, Matthew Trager, and
  Kathlén Kohn, *Algebra Unveils Deep Learning — An Invitation to Neuroalgebraic
  Geometry*, [arXiv:2501.18915v2][invitation], 31 May 2025. Definition 3.1
  supplies the neuromanifold; §3, equation (2), supplies layer composition;
  §3.1 supplies the joint-polynomial setting and finite ambient space; §4.3
  supplies fibres. Appendix A motivates the two-layer linear example, without
  importing its dimension or optimisation claims.
* Vahid Shahverdi, *Algebraic Complexity and Neurovariety of Linear Convolutional
  Networks*, [arXiv:2401.16613v1][cnn], 29 January 2024, §§2.1–2.2.
  Supplementary source for the convolution convention; its closed-image use of
  “neurovariety” differs from the closure convention adopted here.

* Bella Finkel, Jose Israel Rodriguez, Chenxi Wu, and Thomas Yahl,
  *Activation degree thresholds and expressiveness of polynomial neural networks*,
  [arXiv:2408.04569v4][threshold], 25 August 2025. Definition 1, Remark 2,
  equations (3)–(6), and Lemma 4 supply the monomial specialization, closure
  convention, and elementary symmetries. Theorem 18 motivates the boundary
  between these foundations and generic-fibre classification.

[threshold]: https://arxiv.org/html/2408.04569v4

[invitation]: https://arxiv.org/html/2501.18915v2
[cnn]: https://arxiv.org/html/2401.16613v1
[funext]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/MvPolynomial/Funext.lean
[degree]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/MvPolynomial/Basic.lean
[zeros]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Nullstellensatz.lean
[semifunction]: https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/RealAlgebraic/Semialgebraic/Function.lean
[semiimage]: https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/RealAlgebraic/Semialgebraic/Image.lean
[rag]: ../../Completed/RealAlgebraicGeometry/README.md#layer-6-cad-and-quantifier-elimination
